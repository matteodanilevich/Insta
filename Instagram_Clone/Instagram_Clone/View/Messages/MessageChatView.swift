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
            ScrollViewReader { scroll in
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.messages) { message in
                            MessageRowView(message: message)
                        }
                    }
                }
            }
            
            MessageInputView(message: $message, action: messageSend)
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
