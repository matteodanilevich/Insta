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
    @State var usermane = ""
    @State var fullName = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("insta")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260, height: 200)
                    .foregroundColor(.black)
                
                VStack(spacing: -15) {
                    CustomTextField(text: $email, placeholder: Text("E-mail"), imageName: "envelope.circle")
                        .padding()
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $usermane, placeholder: Text("Username"), imageName: "person.circle")
                        .padding()
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full name"), imageName: "person.circle")
                        .padding()
                        .padding(.horizontal, 32)
                    
                    CustomSecureTextField(text: $password, placeholder: Text("Password"), imageName: "lock.circle")
                        .padding()
                        .padding(.horizontal, 32)
                }
                
                Button {
                    
                } label: {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }

                
                Spacer()
                
                NavigationLink {
                    SignInView()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Sign In")
                            .font(.system(size: 14))
                    }
                }
            }
            .padding(.top, -110)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
