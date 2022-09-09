//
//  ProfileEditViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI
import Firebase

class ProfileEditViewModel: ObservableObject {
    
    @Published var uploadComplete = false
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func biographySave(bio: String) {
        
        guard let userID = user.id else { return }
        
        Firestore.firestore().collection("users").document(userID).updateData(["bio": bio]) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.user.bio = bio
            self.uploadComplete = true
        }
    }
}
