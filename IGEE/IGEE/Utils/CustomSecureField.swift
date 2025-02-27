//
//  CustomSecureField.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placehoder: Text
    let imageName: String
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placehoder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.8)))
                    .padding(.leading, 40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}
