//
//  ProfileHeaderView+Extension.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/24/22.
//

import SwiftUI

extension ProfileHeaderView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        viewModel.loadNewProfileImage(image: selectedImage) { _ in
            print("Image Upload")
        }
    }
}
