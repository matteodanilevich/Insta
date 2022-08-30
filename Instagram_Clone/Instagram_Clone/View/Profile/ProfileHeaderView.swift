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
    @State var userImage: Image? = Image("placeholder_image")
    @State var imagePickerRepresent = false
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    if let imageURL = viewModel.user.profileImageURL {
                        Button {
                            self.imagePickerRepresent.toggle()
                        } label: {
                            KFImage(URL(string: imageURL))
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
                    } else {
                        Button {
                            self.imagePickerRepresent.toggle()
                        } label: {
                            userImage?
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
                
                HStack(spacing: 16) {
                    ProfileStats(value: 5, title: "Posts")
                    ProfileStats(value: 15, title: "Followers")
                    ProfileStats(value: 30, title: "Following")
                }
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
                .padding(.leading, 20)
            
            HStack {
                Spacer()
                ProfileViewButtonEdit(viewModel: viewModel)
                Spacer()
            }
            .padding(.top)
        }
    }
}
