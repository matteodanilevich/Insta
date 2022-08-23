//
//  PostUploadView+Extension.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI

extension PostUploadView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postedImage = Image(uiImage: selectedImage)
    }
}
