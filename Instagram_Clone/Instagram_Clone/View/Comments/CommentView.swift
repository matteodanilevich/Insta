//
//  CommentView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI

struct CommentView: View {
    
    @State var comment = ""
    @ObservedObject var viewModel: CommentsViewModel
    
    init(post: Post) {
        self.viewModel = CommentsViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 18) {
                    ForEach(viewModel.comments) { comment in
                        CommentCellView(comment: comment)
                    }
                }
            }
            CommentInputView(comment: $comment, action: uploadComment)
        }
    }
    
    func uploadComment() {
        viewModel.commentUpload(comment: comment)
        comment = ""
    }
}
