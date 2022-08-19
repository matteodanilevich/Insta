//
//  PostUploadView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct PostUploadView: View {
    
//    @State private var selectedImage: UIImage?
//    @State var postedImage: Image
//    @State var captionText = ""
    
    var body: some View {
        Image(systemName: "plus.app")
            .resizable()
            .scaledToFill()
            .frame(width: 175, height: 175)
            .padding(.top)
            .foregroundColor(.black)
        
        
    }
}

struct PostUploadView_Previews: PreviewProvider {
    static var previews: some View {
        PostUploadView()
    }
}
