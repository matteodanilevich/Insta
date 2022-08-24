//
//  AuthentificationViewModel.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/24/22.
//

import SwiftUI
import Firebase

class AuthentificationViewModel: ObservableObject {
    
    @Published var userSession: Firebase.User?
    
    static let shared = AuthentificationViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func register(withEmail email: String, username: String, fullname: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            let data = ["email": email,
                        "username": username,
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users").document(user.uid).setData(data) { error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                print("User created")
            }
        }
    }
    
    func signIn(withEmail email: String, passowrd: String) {
        Auth.auth().signIn(withEmail: email, password: passowrd) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            self.userSession = user
        }
    }
    
    func logOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
