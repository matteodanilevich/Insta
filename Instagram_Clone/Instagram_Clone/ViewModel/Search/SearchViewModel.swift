//
//  SearchViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/27/22.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { snapshot, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            self.users = documents.compactMap({ try? $0.data(as: User.self) })
            print(self.users)
        }
    }
    
    func filterUsers(withText input: String) -> [User] {
        let lowercasedInput = input.lowercased()
        
        return users.filter({ $0.fullname.lowercased().contains(lowercasedInput) || $0.username.lowercased().contains(lowercasedInput) })
    }
}
