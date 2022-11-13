//
//  PostGridView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    private let items = [GridItem(), GridItem(), GridItem()]
    private let frameSize = UIScreen.main.bounds.width / 3
    let type: PostGridType
    
    @ObservedObject var viewModel: GridViewModel
    
    init(type: PostGridType) {
        self.type = type
        self.viewModel = GridViewModel(type: type)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2) {
            ForEach(viewModel.posts) { post in
                
                NavigationLink(destination: ScrollView {FeedCell(viewModel: FeedCellViewModel(post: post))}) {
                    KFImage(URL(string: post.imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: frameSize, height: frameSize)
                        .clipped()
                }
            }
        }
    }
}
