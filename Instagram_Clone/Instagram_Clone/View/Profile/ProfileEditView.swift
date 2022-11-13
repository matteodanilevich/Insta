//
//  ProfileEditView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI

struct ProfileEditView: View {
    
    @Environment(\.presentationMode) var mode
    @ObservedObject var viewModel: ProfileEditViewModel
    @State var biography: String
    @Binding var user: User
    
    init(user: Binding<User>) {
        self._user = user
        self.viewModel = ProfileEditViewModel(user: self._user.wrappedValue)
        self._biography = State(initialValue: _user.bio.wrappedValue ?? "")
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.mode.wrappedValue.dismiss()
                }) {
                    Text("Cancel")
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.biographySave(bio: biography)
                }) {
                    Text("Done")
                }
            }.padding()
            
            TextArea(text: $biography, placeholder: "Add your biography here...")
                .frame(width: 360, height: 200)
                .padding()
            
            Spacer()
        }
        .onReceive(viewModel.$uploadComplete) { complete in
            if complete {
                self.mode.wrappedValue.dismiss()
                self.user.bio = viewModel.user.bio
            }
        }
    }
}

//struct ProfileEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileEditView()
//    }
//}
