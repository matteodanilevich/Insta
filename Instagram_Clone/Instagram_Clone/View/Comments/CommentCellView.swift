//
//  CommentCellView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI
import Kingfisher

struct CommentCellView: View {
    
    let comment: Comment
    
    var body: some View {
        HStack {
            if let profileImage = comment.profileImageURL {
                KFImage(URL(string: profileImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            } else {
                Image("placeholder_image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
            }
            
            HStack {
                Text(comment.username)
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" \(comment.comment)")
                    .font(.system(size: 14))
                
                Spacer()
                
                Text(comment.timestampText ?? "")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
        }
        .padding(.horizontal)
    }
}
