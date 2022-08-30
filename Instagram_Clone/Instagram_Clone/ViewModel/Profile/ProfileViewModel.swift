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
    
//    func followUser(uid: String) {
//
//        guard let currentUID = AuthentificationViewModel.shared.userSession?.uid else { return }
//
//        Firestore.firestore().collection("following").document(currentUID).collection("user_following").document(uid).setData([ : ]) { error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//
//            Firestore.firestore().collection("followers").document(uid).collection("user_followers").document(currentUID).setData([ : ]) { error in
//                if let error = error {
//                    print(error.localizedDescription)
//                    return
//                }
//            }
//        }
//    }
}
