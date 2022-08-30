//
//  ProfileViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/24/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

class ProfileViewModel: ObservableObject {

    @Published var user: User

    init(user: User) {
        self.user = user
    }

    func loadNewProfileImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        guard let uid = user.id else { return }
        
        ImageUploader.imageUpload(image: image, type: .profile) { imageURL in
            Firestore.firestore().collection("users").document(uid).updateData(["profileImageURL": imageURL]) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                self.user.profileImageURL = imageURL
            }
        }
    }
    
    func followUser() {
        
        guard let userID = user.id else { return }
        
        UserAction.followUser(uid: userID) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    func unfollowUser() {
        
        guard let userID = user.id else { return }
        
        UserAction.unfollowUser(uid: userID) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
        }
    }
}
