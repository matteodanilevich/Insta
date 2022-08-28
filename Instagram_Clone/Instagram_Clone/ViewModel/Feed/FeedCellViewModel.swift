//
//  FeedCellViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/28/22.
//

import SwiftUI
import Firebase

class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
        userFetching()
    }
    
    func userFetching() {
        Firestore.firestore().collection("users").document(post.ownerUID).getDocument { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            self.post.user = try? snapshot?.data(as: User.self)
        }
    }
}
