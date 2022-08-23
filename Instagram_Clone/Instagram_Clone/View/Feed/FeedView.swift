//
//  FeedView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 30) {
                ForEach(0..<10) {_ in
                    FeedCell()
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
