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
                .frame(height: 45)
                .background(Color.primary.opacity(0.07))
                .clipShape(Capsule())
            
            if !message.isEmpty {
                Button(action: action) {
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        .frame(width: 45, height: 45)
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
