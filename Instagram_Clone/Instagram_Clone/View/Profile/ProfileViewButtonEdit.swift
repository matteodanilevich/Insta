//
//  ProfileViewButtonEdit.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/25/22.
//

import SwiftUI

struct ProfileViewButtonEdit: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        if viewModel.user.isCurrentUser {
            Button {
                
            } label: {
                    Text("Edit Profile")
                    .font(.system(size: 14, weight: .semibold))
                    .frame(width: 360, height: 36)
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(Color.gray, lineWidth: 1))
            }
        } else {
            HStack(spacing: 16) {
                Button {
                    if let userID = viewModel.user.id {
                        
                    }
                } label: {
                    Text("Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(3)
                }
                
                Button {
                    
                } label: {
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
