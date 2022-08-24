//
//  ContentView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RegisterView().environmentObject(AuthentificationViewModel.shared)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
