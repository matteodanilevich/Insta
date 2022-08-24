//
//  MainView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/18/22.
//

import SwiftUI

struct MainView: View {
    
    @Binding var selectedIndex: Int
    
    var tabTitle: String {
        switch selectedIndex {
        case 0:
            return "Feed"
        case 1:
            return "Search"
        case 2:
            return "Upload"
        case 3:
            return "Activity"
        case 4:
            return "Profile"
        default:
            return ""
        }
    }

    var logOutButton: some View {
        Button {
            AuthentificationViewModel.shared.logOut()
        } label: {
            Text("Log Out")
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onTapGesture {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                SearchView()
                    .onTapGesture {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                PostUploadView()
                    .onTapGesture {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.app")
                    }.tag(2)
                ActivityView()
                    .onTapGesture {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "suit.heart")
                    }.tag(3)
                ProfileView()
                    .onTapGesture {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                    }.tag(4)
            }
            .navigationTitle(tabTitle)
            .navigationBarItems(trailing: logOutButton)
            .accentColor(.black)
        }
    }
}
