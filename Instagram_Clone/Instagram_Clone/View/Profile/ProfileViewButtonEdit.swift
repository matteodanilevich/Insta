//
//  ProfileViewButtonEdit.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/25/22.
//

import SwiftUI

struct ProfileViewButtonEdit: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @State var showProfileEdit = false
    
    var didFollowUser: Bool {
        return viewModel.user.didFollowUser ?? false
    }
    
    var body: some View {
        
        if viewModel.user.isCurrentUser {
            Button {
                self.showProfileEdit.toggle()
            } label: {
                    Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 36)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1))
            }.sheet(isPresented: $showProfileEdit) {
                ProfileEditView(user: $viewModel.user)
            }
        } else {
            HStack(spacing: 16) {
                Button {
                    didFollowUser ? viewModel.unfollowUser() : viewModel.followUser()
                } label: {
                    Text(didFollowUser ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(didFollowUser ? .black : .white)
                        .background(didFollowUser ? Color.white : Color.blue)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: didFollowUser ? 1 : 0))
                }
                .cornerRadius(3)
                
                if let userID = viewModel.user.id {
                    NavigationLink(destination: MessageChatView(userID: userID)) {
                        Text("Message")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(width: 172, height: 32)
                            .foregroundColor(.black)
                            .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: 1))
                    }
                }
            }
        }
    }
}
