//
//  UserCell.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        
        HStack {
            
            Image("corgi")
                .resizable()
                .scaledToFill()
                .frame(width: 46, height: 46)
                .clipped()
                .clipShape(Circle())
            
            VStack {
                
                Text("corgi")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Corgi")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
