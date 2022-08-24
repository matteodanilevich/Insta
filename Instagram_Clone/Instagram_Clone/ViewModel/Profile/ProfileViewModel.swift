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
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }

        let fileName = NSUUID().uuidString
        let reference = Storage.storage().reference(withPath: "/profile_images/\(fileName)")

        reference.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            reference.downloadURL { url, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let imageURL = url?.absoluteString else { return }
            }
        }
    }
}
