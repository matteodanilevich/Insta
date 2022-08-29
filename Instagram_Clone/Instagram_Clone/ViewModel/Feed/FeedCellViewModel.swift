//
//  FeedCellViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/28/22.
//

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        userFetching()
    }
    
    func userFetching() {
        Firestore.firestore().collection("users").document(post.ownerUID).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.post.user = try? snapshot?.data(as: User.self)
        }
    }
    
    func likePost() {
        guard let postUID = post.id, let userID = AuthentificationViewModel.shared.userSession?.uid  else { return }
        
        Firestore.firestore().collection("posts").document(postUID).collection("post_likes").document(userID).setData([ : ]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("users").document(userID).collection("user_likes").document(postUID).setData([ : ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                Firestore.firestore().collection("posts").document(postUID).updateData(["likes" : self.post.likes + 1]) { error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    self.post.likes += 1
                    self.post.didLikePost = true
                }
            }
        }
    }
    
    func unlikePost() {
        
    }
}
