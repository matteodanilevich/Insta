//
//  ProfileView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView()
                    .padding(.vertical)
//                    .padding()
                
                PostGridView()
                    .padding(.horizontal, 8)
            }
            .padding(.top)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
