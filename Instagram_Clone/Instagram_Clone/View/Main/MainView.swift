//
//  MainView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "house")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            PostUploadView()
                .tabItem {
                    Image(systemName: "plus.app")
                }
            ActivityView()
                .tabItem {
                    Image(systemName: "suit.heart")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
