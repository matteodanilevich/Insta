//
//  PostUploadView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct PostUploadView: View {

    @State private(set) var selectedImage: UIImage?
    @State var postedImage: Image?
    @State var imagePickerRepresented = false
    @State var captionText = ""
    
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        if postedImage == nil {
            Button {
                imagePickerRepresented.toggle()
            } label: {
                Image(systemName: "plus.app")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 175, height: 175)
                    .padding(.top)
                    .foregroundColor(.black)
            }.sheet(isPresented: $imagePickerRepresented) {
                loadImage()
            } content: {
                ImagePicker(image: $selectedImage)
            }
        } else if let image = postedImage {
            VStack {
                HStack(alignment: .top) {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                    
                    TextArea(text: $captionText, placeholder: "Enter you text caption")
                }
                .padding()
                
                Button {
                    guard let selectedImage = selectedImage else { return }
                    viewModel.uploadPosts(image: selectedImage, caption: captionText)
                    
                    captionText = ""
                    postedImage = nil
                } label: {
                    Text("Share")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 350, height: 40)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
    }
}
