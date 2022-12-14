//
//  Comment.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

//MARK: Comment struct
struct Comment: Identifiable, Decodable {
    
    @DocumentID var id: String?
    
    let uid: String
    let postOwnerId: String
    let username: String
    let profileImageURL: String?
    let comment: String
    let timestamp: Timestamp
    
    var timestampText: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}
