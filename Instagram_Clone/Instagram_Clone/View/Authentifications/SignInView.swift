//
//  SignInView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/21/22.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
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
                
                VStack(spacing: -15) {
                    CustomTextField(text: $email, placeholder: Text("E-mail"), imageName: "envelope.circle")
                        .padding()
                        .padding(.horizontal, 32)
                        .foregroundColor(isValidEmail(email) ? Color.black : Color.red)
                    
                    CustomSecureTextField(text: $password, placeholder: Text("Password"), imageName: "lock.circle")
                        .padding()
                        .padding(.horizontal, 32)
                        .foregroundColor(isPasswordValid(password) ? Color.black : Color.red)
                }
                
                HStack {
                    Spacer()

                    NavigationLink {
                        ForgotPasswordView(email: $email).navigationBarHidden(true)
                    } label: {
                        Text("Forgot Password?")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.top, -10)
                            .padding(.trailing, 16)
                    }
                }
                
                Button {
                    viewModel.signIn(withEmail: email, password: password)
                } label: {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                
                Spacer()
                
                NavigationLink {
                    RegisterView().navigationBarHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account? ")
                            .font(.system(size: 14, weight: .semibold))
                        Text("Sign Up")
                            .font(.system(size: 14))
                    }.padding(.bottom, 10)
                }
            }
            .padding(.top, -100)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
