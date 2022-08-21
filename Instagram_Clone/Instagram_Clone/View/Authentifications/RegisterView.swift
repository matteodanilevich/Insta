//
//  RegisterView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/21/22.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Image("insta")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 130)
                .foregroundColor(.black)
            
            CustomTextField(text: $email, placeholder: Text("E-mail"), imageName: "envelope")
                .padding()
                .cornerRadius(10)
                .foregroundColor(.gray)
                .padding(.horizontal, 32)
            
            CustomSecureTextField(text: $password, placeholder: Text("Password"), imageName: "envelope")
                .padding()
                .cornerRadius(10)
                .foregroundColor(.gray)
                .padding(.horizontal, 32)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
