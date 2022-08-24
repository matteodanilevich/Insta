//
//  User.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/24/22.
//

import Firebase
import FirebaseFirestoreSwift

struct User: Decodable, Identifiable {

    @DocumentID var id: String?
    let username: String
    let email: String
    let fullname: String
    let profileImageURL: String
}
