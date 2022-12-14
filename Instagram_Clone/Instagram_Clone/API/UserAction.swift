//
//  UserAction.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/30/22.
//

import SwiftUI
import Firebase

struct UserAction {
    
    //MARK: Follow User
    static func followUser(uid: String, completion: ((Error?) -> Void)?) {
        
        guard let currentUID = AuthentificationViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUID).collection("user_following").document(uid).setData([ : ]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("followers").document(uid).collection("user_followers").document(currentUID).setData([ : ], completion: completion)
        }
    }
    
    //MARK: Unfollow User
    static func unfollowUser(uid: String, completion: ((Error?) -> Void)?) {
        
        guard let currentUID = AuthentificationViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUID).collection("user_following").document(uid).delete { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("followers").document(uid).collection("user_followers").document(currentUID).delete(completion: completion)
        }
    }
    
    //MARK: Check follow
    static func checkFollowing(userID: String, completion: @escaping(Bool) -> Void) {
        
        guard let currentUID = AuthentificationViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("following").document(currentUID).collection("user_following").document(userID).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let didFollow = snapshot?.exists else { return }
            
            completion(didFollow)
        }
    }
}
