//
//  CommentsViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    
    @Published var comments = [Comment]()
    let post: Post
    
    init(post: Post) {
        self.post = post
        commentFetch()
    }
    
    //MARK: Comment upload
    func commentUpload(comment: String) {
        
        guard let postID = post.id, let user = AuthentificationViewModel.shared.currentUser, let userID = user.id else { return }
        
        let data: [String: Any] = ["uid": userID,
                                  "postOwnerId": post.ownerUID,
                                  "username": user.username,
                                  "profileImageURL": user.profileImageURL,
                                  "comment": comment,
                                  "timestamp": Timestamp(date: Date())]
        
        Firestore.firestore().collection("posts").document(postID).collection("post_comments").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            NotificationViewModel.sendNotification(withUID: self.post.ownerUID, type: .comment, post: self.post)
        }
    }
    
    //MARK: Comment fetch
    func commentFetch() {
        
        guard let postID = post.id else { return }
        
        //Sort change
        Firestore.firestore().collection("posts").document(postID).collection("post_comments").order(by: "timestamp", descending: false).addSnapshotListener { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documentChange = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            self.comments.append(contentsOf: documentChange.compactMap({ try? $0.document.data(as: Comment.self) }))
        }
    }
}
