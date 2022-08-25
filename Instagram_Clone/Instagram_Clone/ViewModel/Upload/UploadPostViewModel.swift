//
//  UploadPostViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/25/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

class UploadPostViewModel: ObservableObject {
    
    func uploadPosts(image: UIImage, caption: String) {
        
        guard let user = AuthentificationViewModel.shared.currentUser else { return }
        
        ImageUploader.imageUpload(image: image, type: .post) { imageURL in
            guard let uid = user.id else { return }
            
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageURL": imageURL,
                        "ownerUID": uid,
                        "ownerImageURL": user.profileImageURL,
                        "ownerUsername": user.username] as [String : Any]
            Firestore.firestore().collection("posts").addDocument(data: data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
}
