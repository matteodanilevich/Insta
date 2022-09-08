//
//  ForgotPasswordView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 8/21/22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @Binding var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
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
                }
                
                HStack {
                    Spacer()

                    NavigationLink {
                        SignInView().navigationBarHidden(true)
                    } label: {
                        Text("Go back")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.top, -10)
                            .padding(.trailing, 16)
                    }
                }
                
                Button {
                    
                } label: {
                    Text("Reset password")
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
                        Text("Have an account?")
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(email: .constant("Email"))
    }
}
