//
//  Comment.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Comment: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let ownerUID: String
    let username: String
    let ownerImageURL: String
    let comment: String
    let timestamp: Timestamp
}
