//
//  CommentInputView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/5/22.
//

import SwiftUI

struct CommentInputView: View {
    
    @Binding var comment: String
    var action: () -> Void
    
    var body: some View {
        VStack {
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 0.8)
                .foregroundColor(Color(.separator))
                
            HStack {
                TextField("Comment...", text: $comment)
                    .textFieldStyle(PlainTextFieldStyle())
                    .frame(minHeight: 30)
                
                Button(action: action) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 8)
    }
}
