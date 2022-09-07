//
//  MessageInputView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI

struct MessageInputView: View {
    
    @Binding var message: String
    var action: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            TextField("Message...", text: $message)
                .padding(.horizontal)
                .frame(height: 36)
                .background(Color.primary.opacity(0.07))
                .clipShape(Capsule())
            
            if !message.isEmpty {
                Button(action: action) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .frame(width: 36, height: 36)
                        .background(Color.blue)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
    }
}

//struct MessageInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageInputView()
//    }
//}
