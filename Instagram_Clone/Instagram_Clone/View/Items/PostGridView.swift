//
//  PostGridView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let frameSize = UIScreen.main.bounds.width / 3
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(0..<10) {_ in
                
                Image("corgi")
                    .resizable()
                    .scaledToFill()
                    .frame(width: frameSize, height: frameSize)
                    .clipped()
            }
        }
    }
}

struct PostGridView_Previews: PreviewProvider {
    static var previews: some View {
        PostGridView()
    }
}
