//
//  Post.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/25/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct Post: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let ownerUID: String
    let ownerUsername: String
    let ownerImageURL: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timestamp: Timestamp
}
