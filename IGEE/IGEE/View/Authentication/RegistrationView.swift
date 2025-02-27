//
//  RegistrationView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI

struct RegistrationView: View {
    @State private var selectedImage: UIImage?
    @State var image: Image?
    @State var imagePickerPersented = false
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                ZStack {
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 140, height: 140)
                            .clipShape(Circle())
                    } else {
                        Button(action: { imagePickerPersented.toggle()}, label: {
                            Image("Add")
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .foregroundColor(.white)
                        }).sheet(isPresented: $imagePickerPersented, onDismiss: loadImage, content: {
                            ImagePicker(image: $selectedImage)
                            
                        })
                    }
                }
                
                VStack(spacing: 20) {
                    
                    // email field
                    CustomTextField(text: $email, placehoder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $username, placehoder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                    
                    CustomTextField(text: $fullname, placehoder: Text("Full Name"), imageName: "person")
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
                
                // sing in
                Button(action: {
                    viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame().frame(width: 360, height: 50)
                        .background(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                        .clipShape(Capsule())
                        .padding()
                })
                
                // go to sing up
                
                Spacer()
                
                
                
                Button(action: { mode.wrappedValue.dismiss()}, label: {
                    HStack {
                        Text("Already havre an account?")
                            .font(.system(size: 14))
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                        
                    }.foregroundColor(.white)
                }).padding(.bottom, 16)
                
            }
        }
    }
}

extension RegistrationView {
    func loadImage() {
        guard let seletedImage = selectedImage else {return}
        image = Image(uiImage: seletedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
