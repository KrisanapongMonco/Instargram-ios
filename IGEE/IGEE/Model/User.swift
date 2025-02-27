//
//  User.swift
//  IGEE
//
//  Created by 03 on 18/6/2566 BE.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    let username: String
    let email: String
    let profileImageUrl: String
    let fullname: String
    @DocumentID var id: String?
    var bio: String?
    var isFollowed: Bool? = false
    var stats: UserStats?
    var isCurrentUser: Bool {return AuthViewModel.shared.userSession?.uid == id}
}

struct UserStats: Decodable {
    var following: Int
    var posts: Int
    var followers: Int
}
