//
//  CommentView.swift
//  IGEE
//
//  Created by 03 on 24/6/2566 BE.
//

import SwiftUI

struct CommentsView: View {
    
    @State var commentText = ""
    @ObservedObject var viewModel: CommentViewModel
    
    init(post: Post) {
        
        self.viewModel = CommentViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            // comment cells
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 24) {
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }.padding(.top)
            
            // input view
            CustomInputView(inputText: $commentText , action: uploadCommend)
        }
    }
    
    func uploadCommend() {
        viewModel.uploadComment(commentText: commentText)
        commentText = ""
    }
}
//
//struct CommentView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsView()
//    }
//}
