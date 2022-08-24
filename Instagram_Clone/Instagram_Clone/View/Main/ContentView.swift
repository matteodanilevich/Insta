//
//  ContentView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthentificationViewModel
    @State var selectedIndex = 0
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                SignInView()
            } else {
                if let user = viewModel.currentUser {
                    MainView(user: user, selectedIndex: $selectedIndex)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
