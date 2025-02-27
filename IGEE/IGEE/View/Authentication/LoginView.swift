//
//  LoginView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    var body: some View {
        
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 220, height: 100)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 20) {
                        
                        // email field
                        CustomTextField(text: $email, placehoder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        // password field
                        
                        CustomSecureField(text: $password, placehoder: Text("Password"), imageName: "")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 32)
                        
                    }
                    
                    // forgot password
                    
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ResetPasswordView(email: $email),
                                       label:  {
                            Text("Forgot Password? ")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 20)
                        }
                        )
                    }
                    // sing in
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame().frame(width: 360, height: 50)
                            .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                            .clipShape(Capsule())
                            .padding()
                    })
                    
                    // go to sing up
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: RegistrationView()
                            .navigationBarHidden(true),
                        label: {
                            HStack {
                                Text("Don't havre an account?")
                                    .font(.system(size: 14))
                                
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                                
                            }.foregroundColor(.white)
                        }).foregroundColor(.white)
                    
                    
                    Button(action: {}, label: {
                        
                    }).padding(.bottom, 16)
                }
                .padding(.top, -44)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
