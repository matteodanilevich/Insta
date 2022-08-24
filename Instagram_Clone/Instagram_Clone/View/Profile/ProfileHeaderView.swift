//
//  ProfileHeaderView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/21/22.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("corgi")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading, 16)
                
                Spacer()
                
                HStack(spacing: 16) {
                    ProfileStats(value: 5, title: "Posts")
                    ProfileStats(value: 15, title: "Followers")
                    ProfileStats(value: 30, title: "Following")
                }
                .padding(.trailing, 32)
            }
            
            Text(AuthentificationViewModel.shared.currentUser?.fullname ?? "")
                .font(.system(size: 15, weight: .bold))
                .padding([.leading, .top])
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
