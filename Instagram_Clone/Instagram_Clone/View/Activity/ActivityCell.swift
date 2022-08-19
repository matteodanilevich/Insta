//
//  ActivityCell.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI

struct ActivityCell: View {
    var body: some View {
        HStack {
            Image("corgi")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())

            Text("corgi")
                .font(.system(size: 14, weight: .semibold))
            +
            Text(" has followed you profile")
                .font(.system(size: 16))
            +
            Text(" 3H")
                .foregroundColor(.gray)
                .font(.system(size: 12))

            Spacer()

            Text("Follow")
                .font(.system(size: 14, weight: .semibold))
                .frame(width: 100, height: 30)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(3)
                .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color.gray, lineWidth: 1)
            )
        }
            .padding(.horizontal)
    }
}

struct ActivityCell_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCell()
    }
}
