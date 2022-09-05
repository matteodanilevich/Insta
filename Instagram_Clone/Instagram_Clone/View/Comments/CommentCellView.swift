//
//  CommentCellView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI

struct CommentCellView: View {
    var body: some View {
        HStack {
            Image("corgi")
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            HStack {
                Text("corgi")
                    .font(.system(size: 14, weight: .semibold))
                +
                Text(" Comment")
                    .font(.system(size: 14))
                
                Spacer()
                
                Text("3h")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                    .padding(.trailing)
            }
        }
        .padding(.horizontal)
    }
}

struct CommentCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommentCellView()
    }
}
