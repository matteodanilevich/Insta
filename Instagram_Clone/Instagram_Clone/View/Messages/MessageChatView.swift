//
//  MessageChatView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI

struct MessageChatView: View {
    
    @State var message = ""
    
    var body: some View {
        VStack {
            MessageInputView(message: $message, action: messageSend)
        }
    }
    
    func messageSend() {
        print("Message send")
    }
}

//struct MessageChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageChatView()
//    }
//}
