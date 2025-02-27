//
//  PostGridView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI
import KingfisherSwiftUI
struct PostGridView: View {
//    private let items = [GridItem(), GridItem(), GridItem()]
//    private let width = UIScreen.main.bounds.width / 3
//    let config: PostGridConfiguration
//    @ObservedObject var viewModel: PostGridViewModel
//
//    init(config: PostGridConfiguration) {
//        self.config = config
//        self.viewModel = PostGridViewModel(config: config)
//    }
    private let items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    let config: PostGridConfiguration
    let postID: String?
    @ObservedObject var viewModel: PostGridViewModel
    
    init(config: PostGridConfiguration, postID: String? = nil) {
        self.config = config
        self.postID = postID
        self.viewModel = PostGridViewModel(config: config, postID: postID)
    }
    
    var body: some View {
        LazyVGrid(columns: items, spacing: 2, content: {
            ForEach(viewModel.posts) { post in
                NavigationLink(
                    destination: FeedCell(viewModel: FeedCellViewModel(post: post)),
                    label: {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: width, height: width)
                            .clipped()
                    })
            }
        })
    }
}

//struct PostGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostGridView()
//    }
//}
