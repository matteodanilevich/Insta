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
    var profileImageURL: String?
    var stats: UserStats?
    
    var isCurrentUser: Bool {
        return AuthentificationViewModel.shared.userSession?.uid == id
    }
    
    var didFollowUser: Bool? = false
    var bio: String?
}
