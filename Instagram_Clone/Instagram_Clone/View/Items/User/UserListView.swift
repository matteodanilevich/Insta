//
//  UserListView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI

struct UserListView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    @Binding var seachName: String
    
    var users: [User] {
        return seachName.isEmpty ? viewModel.users : viewModel.filterUsers(withText: seachName)
    }
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    UserCell(user: user)
                        .padding(.leading, 8)
                }
            }
        }
    }
}
