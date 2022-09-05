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
                    ForEach(0..<10) { _ in
                        CommentCellView()
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
//
//struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentView()
//    }
//}
