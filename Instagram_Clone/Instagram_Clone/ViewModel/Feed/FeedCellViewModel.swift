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
    
    var timestamp: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day]
//        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    var likeText: String {
        let label = post.likes == 1 ? "like" : "likes"
        return "\(post.likes) \(label)"
    }
    
    init(post: Post) {
        self.post = post
        userFetching()
        checkingPostLikes()
    }
    
    func userFetching() {
        Firestore.firestore().collection("users").document(post.ownerUID).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.post.user = try? snapshot?.data(as: User.self)
            
            guard let userImageURL = self.post.user?.profileImageURL else { return }
            self.post.ownerImageURL = userImageURL
        }
    }
    
    func likePost() {
        guard let postUID = post.id, let userID = AuthentificationViewModel.shared.userSession?.uid else { return }
        
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
                    
                    NotificationViewModel.sendNotification(withUID: self.post.ownerUID, type: .like, post: self.post)
                    
                    self.post.likes += 1
                    self.post.didLikePost = true
                }
            }
        }
    }
    
    func checkingPostLikes() {
        guard let postID = post.id, let userID = AuthentificationViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("posts").document(postID).collection("post_likes").document(userID).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let didLike = snapshot?.exists else { return }
            
            self.post.didLikePost = didLike
        }
    }
    
    func unlikePost() {
        
        guard post.likes > 0 else { return }
        guard let postUID = post.id, let userID = AuthentificationViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("posts").document(postUID).collection("post_likes").document(userID).delete { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
        
        Firestore.firestore().collection("users").document(userID).collection("user_likes").document(postUID).delete { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.post.didLikePost = false
            self.post.likes -= 1
        }
    }
    
    
}
