//
//  FeedViewModel.swift
//  IGEE
//
//  Created by 03 on 24/6/2566 BE.
//

import SwiftUI

class FeedViewModel : ObservableObject {
    @Published var posts = [Post]()
    
    init(){
        fetchPost()
    }
    
    func fetchPost() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
            
//            print(self.posts)
        }
    }
}
