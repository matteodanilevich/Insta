//
//  ProfileView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: ProfileViewModel(user: user))
                    .padding(.vertical)
//                    .padding()
                
                if let currentUserID = user.id {
                    PostGridView(type: .profile(currentUserID))
                        .padding(.horizontal, 12)
                }
//                PostGridView(type: .profile(user.id))
//                    .padding(.horizontal, 8)
            }
            .padding(.top)
        }
    }
}
