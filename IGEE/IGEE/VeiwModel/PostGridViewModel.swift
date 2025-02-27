//
//  PostGridViewModel.swift
//  IGEE
//
//  Created by 03 on 24/6/2566 BE.
//

import SwiftUI

enum PostGridConfiguration {
    case explore
    case profile(String)
}

class PostGridViewModel: ObservableObject {
//    @Published var posts = [Post]()
//    let config: PostGridConfiguration
//
//    init(config: PostGridConfiguration) {
////        fetchPost()
//        self.config = config
//        fetchPosts(forConfig: config)
//    }
    @Published var posts = [Post]()
    let config: PostGridConfiguration
    let postID: String?
    
    init(config: PostGridConfiguration, postID: String? = nil) {
        self.config = config
        self.postID = postID
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePagePosts()
        case .profile(let uid):
            fetchUserPosts(forUid: uid)
        }
    }
    
    func fetchExplorePagePosts() {
        COLLECTION_POSTS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: Post.self)})
            
        }
    }
    
    func fetchUserPosts(forUid uid: String) {
        if let postID = postID {
            COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid)
                .whereField("id", isEqualTo: postID)
                .getDocuments { snapshot, _ in
                    guard let documents = snapshot?.documents else { return }
                    let posts = documents.compactMap({ try? $0.data(as: Post.self)})
                    self.posts = posts.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() })
                }
        } else {
            COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let posts = documents.compactMap({ try? $0.data(as: Post.self)})
                self.posts = posts.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() })
            }
        }
    }
//    func fetchUserPosts(forUid uid: String) {
//        COLLECTION_POSTS.whereField("ownderUid", isEqualTo: uid).getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            let posts = documents.compactMap({ try? $0.data(as: Post.self)})
//            self.posts = posts.sorted(by: {$0.timestamp.dateValue() > $1.timestamp.dateValue() })
//        }
//    }
}
