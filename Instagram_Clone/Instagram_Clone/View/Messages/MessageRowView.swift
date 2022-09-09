//
//  MessageRowView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI
import Kingfisher

struct MessageRowView: View {
    
    let message: Message
    var yourAccount: Bool {
        return message.uid == AuthentificationViewModel.shared.userSession?.uid
    }
    
    var body: some View {
        HStack(spacing: 16) {
            if !yourAccount {
                if let profileImage = message.profileImageURL {
                    KFImage(URL(string: profileImage))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                        .clipShape(Circle())
                } else {
                    Image("placeholder_image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                        .clipShape(Circle())
                }
            }
            
            if yourAccount {
                Spacer(minLength: 0)
            }
            
            VStack(alignment: yourAccount ? .trailing : .leading, spacing: 5) {
                Text(message.message)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(MessageBubbleView(yourAccount: self.yourAccount))
                
                Text(message.timestampText ?? "")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(yourAccount ? .trailing : .leading, 10)
            }
            
            if !yourAccount {
                Spacer(minLength: 0)
            }
            
            if yourAccount {
                if let profileImage = message.profileImageURL {
                    KFImage(URL(string: profileImage))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                        .clipShape(Circle())
                } else {
                    Image("placeholder_image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                        .clipShape(Circle())
                }
            }
        }
        .padding(6)
    }
}

//struct MessageRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageRowView()
//    }
//}
