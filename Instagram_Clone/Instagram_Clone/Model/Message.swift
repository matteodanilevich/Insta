//
//  Message.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Decodable {
    
    @DocumentID var id: String?
    
    let uid: String
    let receiverID: String
    let profileImageURL: String?
    let message: String
    let timestamp: Timestamp
    
    var timestampText: String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
}
