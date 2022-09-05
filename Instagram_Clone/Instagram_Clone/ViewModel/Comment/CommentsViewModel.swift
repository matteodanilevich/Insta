//
//  CommentsViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI
import Firebase

class CommentsViewModel: ObservableObject {
    
    @Published var comments = []
    let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func commentUpload(comment: String) {
        
        guard let postID = post.id, let user = AuthentificationViewModel.shared.currentUser, let userID = user.id else { return }
        
        var data: [String: Any] = ["uid": userID,
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
}
