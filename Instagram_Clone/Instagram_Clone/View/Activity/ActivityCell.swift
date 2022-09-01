//
//  ActivityCell.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI
import Kingfisher

struct ActivityCell: View {
    
    @ObservedObject var viewModel: NotificationCellViewModel
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    if let imageURL = viewModel.notification.profileImageURL {
                        KFImage(URL(string: imageURL))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    } else {
                        Image("placeholder_image")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
        
                    Text(viewModel.notification.username)
                        .font(.system(size: 14, weight: .semibold))
                    +
                    Text(viewModel.notification.type.notificationMessage)
                        .font(.system(size: 16))
                    +
                    Text(" \(viewModel.timestamp)")
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                }
            }

            Spacer()

            if viewModel.notification.type == .follow {
                Text("Follow")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 100, height: 25)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(4)
                    .overlay(
                    RoundedRectangle(cornerRadius: 3)
                        .stroke(Color.gray, lineWidth: 1)
                )
            } else {
                if let post = viewModel.notification.post {
                    KFImage(URL(string: post.imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                }
            }
        }
            .padding(.horizontal)
    }
}

//struct ActivityCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityCell()
//    }
//}
