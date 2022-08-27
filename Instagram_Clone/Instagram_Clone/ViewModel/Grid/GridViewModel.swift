//
//  GridViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/27/22.
//

import SwiftUI
import Firebase

enum PostGridType {
    case search
    case profile(String)
}

class GridViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    let type: PostGridType
    
    init(type: PostGridType) {
        self.type = type
        postFetching()
    }
    
    func postFetching() {
        switch type {
        case .search:
            searchViewPostFetching()
        case .profile(let userID):
            profileViewPostFetching(withUID: userID)
        }
    }
    
    func searchViewPostFetching() {
        Firestore.firestore().collection("posts").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
    
    func profileViewPostFetching(withUID uid: String) {
        Firestore.firestore().collection("posts").whereField("ownerUID", isEqualTo: uid).getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            self.posts = documents.compactMap({ try? $0.data(as: Post.self) })
        }
    }
}
