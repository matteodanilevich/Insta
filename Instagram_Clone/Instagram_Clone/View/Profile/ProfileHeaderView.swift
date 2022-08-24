//
//  ProfileHeaderView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/21/22.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    
    @State var selectedImage: UIImage?
    @State var userImage: Image?
    @State var imagePickerRepresent = false
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    if let imageURL = viewModel.user.profileImageURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                            .padding(.leading, 16)
                    } else {
                        Button {
                            self.imagePickerRepresent.toggle()
                        } label: {
                            Image("placeholder_image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .padding(.leading, 16)
                        }
                        .sheet(isPresented: $imagePickerRepresent) {
                            loadImage()
                        } content: {
                            ImagePicker(image: $selectedImage)
                        }
                    }
                }
                
                Spacer()
                
                HStack(spacing: 16) {
                    ProfileStats(value: 5, title: "Posts")
                    ProfileStats(value: 15, title: "Followers")
                    ProfileStats(value: 30, title: "Following")
                }
                .padding(.trailing, 32)
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
        }
    }
}
