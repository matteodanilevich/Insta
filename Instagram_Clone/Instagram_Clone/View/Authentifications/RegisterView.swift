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
    @State var username = ""
    @State var fullName = ""
    
    @EnvironmentObject var viewModel: AuthentificationViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image("insta")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 260, height: 200)
                    .foregroundColor(.black)
                    .padding(.top, 75)
                
                VStack(spacing: -20) {
                    CustomTextField(text: $email, placeholder: Text("E-mail"), imageName: "envelope.circle")
                        .padding()
                        .padding(.horizontal, 32)
                        .foregroundColor(isValidEmail(email) ? Color.black : Color.red)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person.circle")
                        .padding()
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullName, placeholder: Text("Full name"), imageName: "person.circle")
                        .padding()
                        .padding(.horizontal, 32)
                    
                    CustomSecureTextField(text: $password, placeholder: Text("Password"), imageName: "lock.circle")
                        .padding()
                        .padding(.horizontal, 32)
                        .foregroundColor(isPasswordValid(password) ? Color.black : Color.red)
                    
                    Text("Password must contain from 6 to 10 characters, at least 1 uppercase and 1 lowercase alphabet, 1 number and 1 special character")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .padding(.top, 6)
                        .padding([.leading, .trailing])
                }
                
                Button {
                    if isValidEmail(email) && isPasswordValid(password) {
                        viewModel.register(withEmail: email, username: username, fullname: fullName, password: password)
                    }
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
                    SignInView().navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Sign In")
                            .font(.system(size: 14))
                    }.padding(.bottom, 10)
                }
            }
            .padding(.top, -125)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
