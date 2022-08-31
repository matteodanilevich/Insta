//
//  NotificationViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/31/22.
//

import SwiftUI
import Firebase

class NotificationViewModel: ObservableObject {

    static func sendNotification(withUID uid: String, type: NotificationType, post: Post? = nil) {

        guard let user = AuthentificationViewModel.shared.currentUser, let userID = user.id else { return }

        var data: [String : Any] = ["username": user.username,
                                  "uid": userID,
                                  "profileImageURL": user.profileImageURL,
                                  "type": type.rawValue,
                                  "timestamp": Timestamp(date: Date())]
        
        if let post = post, let id = post.id {
            data["postID"] = id
        }
        
        Firestore.firestore().collection("notifications").document(uid).collection("user_notifications").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
}
