//
//  Instagram_CloneApp.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI
import Firebase

@main
struct Instagram_CloneApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthentificationViewModel.shared)
        }
    }
}
