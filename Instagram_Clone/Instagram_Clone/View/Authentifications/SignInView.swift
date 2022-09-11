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
//    @State var emailIsValid: Bool = true
//    @State var passwordIsValid: Bool = true
    
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
//                        .onChange(of: email) { newValue in
//                            if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
//                                self.emailIsValid = true
//                                print("valid")
//                            } else {
//                                self.emailIsValid = false
//                                print("invalid")
//                            }
//                        }
//                        .foregroundColor(emailIsValid ? Color.black : Color.red)
                        .foregroundColor(isValidEmail(email) ? Color.black : Color.red)
                    
                    CustomSecureTextField(text: $password, placeholder: Text("Password"), imageName: "lock.circle")
                        .padding()
                        .padding(.horizontal, 32)
//                        .onChange(of: password) { newValue in
//                            if(newValue.range(of:"^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{6,10}$", options: .regularExpression) != nil) {
//                                self.passwordIsValid = true
//                                print("valid")
//                            } else {
//                                self.passwordIsValid = false
//                                print("invalid")
//                            }
//                        }
//                        .foregroundColor(passwordIsValid ? Color.black : Color.red)
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
