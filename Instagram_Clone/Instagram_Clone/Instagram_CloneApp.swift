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
    
    @State private var showLaunchView: Bool = true
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView().environmentObject(AuthentificationViewModel.shared)
                
                ZStack {
                    if showLaunchView {
                        LaunchView(showLauchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(1.5)
            }
        }
    }
}
