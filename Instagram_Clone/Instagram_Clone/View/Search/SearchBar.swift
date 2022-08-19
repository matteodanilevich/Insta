//
//  SearchBar.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/19/22.
//

import SwiftUI

struct SearchBar: View {

    @Binding var searchText: String
    @Binding var isEditing: Bool

    var body: some View {

        HStack {
            TextField("Search...", text: $searchText)
                .padding(6)
                .padding(.horizontal, 24)
                .background(Color(.systemGray5))
                .cornerRadius(6)
                .overlay {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 3)
                }
            }
            
            Button {
                isEditing = false
                searchText = ""
                UIApplication.shared.endEditing()
            } label: {
                Text("Cancel")
                    .foregroundColor(.black)
            }
            .padding(.trailing, 8)
            .transition(.move(edge: .trailing))
            .animation(.default, value: 0)
        }
        .onTapGesture {
            isEditing = true
        }
    }
}
