//
//  UploadPostView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI

struct UploadPostView: View {
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var captionText = ""
    @State var imagePickerPersented = false
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    
    var body: some View {
        VStack{
            if postImage == nil {
                Button(action: { imagePickerPersented.toggle() }, label: {
                    Image("Add")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .clipped()
                        .padding(.top, 56)
                        .foregroundColor(.black)
                }).sheet(isPresented: $imagePickerPersented, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedImage)
                    
                })
            } else if let image = postImage {
                HStack(alignment: .top){
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 96)
                        .clipped()
                    
                    //                    TextField("Enter your caption..", text: $captionText)
                    TextArea(text: $captionText, placeholder: "Enter your capion..")
                        .frame(height: 200)
                }.padding()
                
               
                HStack(spacing: 16) {
                    Button(action: {
                        captionText = ""
                        postImage = nil
                           }, label: {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.red)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    })
                    
                    Button(action: {
                        if let image = selectedImage {
                            viewModel.uploadPost(caption: captionText, image: image) { _ in
                                captionText = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                        
                    }, label: {
                        Text("Share")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: 172, height: 50)
                            .background(Color.blue)
                            .cornerRadius(5)
                            .foregroundColor(.white)
                    })
                }.padding()
            }
            Spacer()
        }
    }
}

extension UploadPostView {
    func loadImage() {
        guard let seletedImage = selectedImage else {return}
        postImage = Image(uiImage: seletedImage)
    }
}
//
//struct UploadPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        UploadPostView()
//    }
//}
