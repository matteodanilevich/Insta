//
//  Notification.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/31/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

enum NotificationType: Int, Decodable {
    case follow
    case comment
    case like
    
    var notificationMessage: String {
        switch self {
        case .follow:
            return "start following you"
        case .comment:
            return "commented your post"
        case .like:
            return "liked your post"
        }
    }
}

struct Notification: Decodable, Identifiable {
    
    @DocumentID var id: String?
    
    var postID: String?
    var username: String
    var profileImageURL: String?
    var timestamp: Timestamp
    var uid: String
    var type: NotificationType
    
    var post: Post?
    var user: User?
    
    var didFollowUser: Bool? = false
}
