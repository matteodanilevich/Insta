//
//  MessageChatView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI

struct MessageChatView: View {
    
    @State var message = ""
    @State var scrolled = false
    @ObservedObject var viewModel: MessageViewModel
    
    init(userID: String) {
        self.viewModel = MessageViewModel(userID: userID)
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { scrollReader in
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.messages) { message in
                            MessageRowView(message: message)
                                .onAppear {
                                    if message.id == self.viewModel.messages.last?.id && !scrolled {
                                        scrollReader.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
                                        scrolled = true
                                    }
                                }
                        }
                        .onChange(of: viewModel.messages) { _ in
                            scrollReader.scrollTo(viewModel.messages.last?.id, anchor: .bottom)
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
