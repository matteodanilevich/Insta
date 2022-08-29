//
//  FeedCell.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var viewModel: FeedCellViewModel
    var didLikePost: Bool {
        return viewModel.post.didLikePost ?? false
    }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = viewModel.post.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    HStack {
                        if let imageURL = viewModel.post.ownerImageURL {
                            KFImage(URL(string: imageURL))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 36, height: 36)
                                .clipped()
                                .cornerRadius(18)
                        } else {
                            Image("placeholder_image")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 36, height: 36)
                                .clipped()
                                .cornerRadius(18)
                        }
                        Text(viewModel.post.ownerUsername)
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .padding([.leading, .bottom], 8)
                }
            }

            
            KFImage(URL(string: viewModel.post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 390)
                .clipped()
            
            HStack(spacing: 16) {
                Button {
                    didLikePost ? viewModel.unlikePost() : viewModel.likePost()
                } label: {
                    Image(systemName: didLikePost ? "suit.heart.fill" : "suit.heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLikePost ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .padding(3)
                }
                
                Image(systemName: "bubble.right")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(3)
                
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                    .frame(width: 20, height: 20)
                    .font(.system(size: 20))
                    .padding(3)
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            Text(viewModel.likeText)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 0.5)
            
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text(" \(viewModel.post.caption)").font(.system(size: 14))
            }.padding(.horizontal, 8)
            
            Text(viewModel.timestamp)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, -3)
        }
    }
}
