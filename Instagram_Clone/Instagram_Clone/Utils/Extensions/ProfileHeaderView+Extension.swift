//
//  ProfileHeaderView+Extension.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/24/22.
//

import SwiftUI

extension ProfileHeaderView {
    
    //MARK: Image load
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        userImage = Image(uiImage: selectedImage)
        viewModel.loadNewProfileImage(image: selectedImage) { _ in
            print("DEBUG: Image Upload")
        }
    }
}
