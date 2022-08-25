//
//  ImageUploader.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/25/22.
//

import SwiftUI
import Firebase
import FirebaseStorage

enum UploadedType {
    case profile
    case post
    
    var filePath: StorageReference {
        let fileName = NSUUID().uuidString
        switch self {
        case .profile:
            return Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        case .post:
            return Storage.storage().reference(withPath: "/post_images/\(fileName)")
        }
    }
}

struct ImageUploader {

    static func imageUpload(image: UIImage, type: UploadedType, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }

        let reference = type.filePath
        
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
                completion(imageURL)
            }
        }
    }
}
