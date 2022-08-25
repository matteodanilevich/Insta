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
                
                PostGridView()
                    .padding(.horizontal, 8)
            }
            .padding(.top)
        }
    }
}
