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
                    ProfileStats(value: viewModel.user.stats?.posts ?? 0, title: "Posts")
                    ProfileStats(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    ProfileStats(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }
            }
            
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
                .padding(.leading, 6)
            
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            
            
            HStack {
                Spacer()
                ProfileViewButtonEdit(viewModel: viewModel)
                Spacer()
            }
            .padding(.top)
        }
    }
}
