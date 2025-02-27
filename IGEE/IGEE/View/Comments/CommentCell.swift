//
//  CommentCell.swift
//  IGEE
//
//  Created by 03 on 24/6/2566 BE.
//

import SwiftUI
import KingfisherSwiftUI

struct CommentCell: View {
    let comment: Comment
    
    var body: some View {
        HStack {
            KFImage(URL(string: comment.profileImageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            Text(comment.username).font(.system(size: 14, weight: .semibold)) +
            Text(" \(comment.commentText)").font(.system(size: 14))
            
            Spacer()
            
            Text("\(comment.timestampString ?? "")")
                .foregroundColor(.gray)
                .font(.system(size: 12))
        }.padding(.horizontal)
    }
}
//
//struct CommentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCell()
//    }
//}
