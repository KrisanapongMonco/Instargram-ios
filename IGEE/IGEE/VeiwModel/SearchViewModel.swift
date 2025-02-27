//
//  SearchViewModel.swift
//  IGEE
//
//  Created by 03 on 18/6/2566 BE.
//

import SwiftUI
import Firebase

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
//    @Published var posts = [Post]()
    
    init() {
        fetchUsers()
//        fetchPosts()
    }
    
    func fetchUsers() {
        COLLECTION_USERS.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.users = documents.compactMap({try? $0.data(as: User.self)})
        }
    }
    
//    func fetchPosts() {
//        COLLECTION_POSTS.getDocuments { snapshot, _ in
//            guard let documents = snapshot?.documents else { return }
//            self.posts = documents.compactMap({try? $0.data(as: Post.self)})
//        }
//    }
        func filteredUser(_ qurery: String) -> [User] {
            let lowercasedQurery = qurery.lowercased()
            return users.filter({ $0.fullname.lowercased().contains(lowercasedQurery) || $0.username.contains(lowercasedQurery) })
        }
    }

