//
//  MessageViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI
import Firebase

class MessageViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    let currentUserID: String
    
    init(userID: String) {
        self.currentUserID = userID
        messageFetch(withUid: currentUserID)
    }
    
    func messageSend(message: String) {
        
        guard let user = AuthentificationViewModel.shared.currentUser, let userID = AuthentificationViewModel.shared.userSession?.uid, let receiverID = user.id else { return }
        
        var data: [String: Any] = ["uid": userID,
                                   "receiverID": receiverID,
                                   "profileImageURL": user.profileImageURL,
                                   "message": message,
                                   "timestamp": Timestamp(date: Date())]
        
        Firestore.firestore().collection("messages").document(userID).collection("user_messages").document(currentUserID).collection("messages").addDocument(data: data) { error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            Firestore.firestore().collection("messages").document(self.currentUserID).collection("user_messages").document(userID).collection("messages").addDocument(data: data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
            }
        }
    }
    
    func messageFetch(withUid currentUserProfileID: String) {
        
        guard let currentUserID = AuthentificationViewModel.shared.userSession?.uid else { return }
        
        Firestore.firestore().collection("messages").document(currentUserID).collection("user_messages").document(currentUserProfileID).collection("messages").addSnapshotListener { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documentChange = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            self.messages.append(contentsOf: documentChange.compactMap({ try? $0.document.data(as: Message.self)}))
        }
    }
}
