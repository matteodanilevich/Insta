//
//  MessageChatView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI

struct MessageChatView: View {
    
    @State var message = ""
    @ObservedObject var viewModel: MessageViewModel
    
    init(userID: String) {
        self.viewModel = MessageViewModel(userID: userID)
    }
    
    var body: some View {
        VStack {
            MessageInputView(message: $message, action: messageSend)
                .onAppear{
                    print(viewModel.messages)
                }
        }
    }
    
    func messageSend() {
        viewModel.messageSend(message: message)
        message = ""
        print("Message send")
    }
}

//struct MessageChatView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageChatView()
//    }
//}
