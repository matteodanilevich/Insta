//
//  UserCell.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack {
            if let imageURL = user.profileImageURL {
                KFImage(URL(string: imageURL))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 46, height: 46)
                    .clipped()
                    .clipShape(Circle())
            } else {
                Image("placeholder_image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 46, height: 46)
                    .clipped()
                    .clipShape(Circle())
            }
            
            VStack {
                
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}
