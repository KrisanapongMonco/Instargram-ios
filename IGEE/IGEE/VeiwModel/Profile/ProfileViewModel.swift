//
//  ProfileViewModel.swift
//  IGEE
//
//  Created by 03 on 24/6/2566 BE.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserFollowed()
        fetchUserStats()
    }
    
    func follow(){
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            
            NotificationsViewModel.uploadNotifications(toUid: uid, type: .follow)
            
            self.user.isFollowed = true
        }
    }
    
    func unfollow(){
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkIfUserFollowed(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }

    func fetchUserStats() {
        guard let uid = user.id else {return}
        
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else {return}
            
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
                guard let followers = snapshot?.documents.count else {return}
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    guard let posts = snapshot?.documents.count else {return}
                    
                    self.user.stats = UserStats(following: following, posts: posts, followers: followers)
//                    print(self.user.stats)
                }
            }
        }
    }
}
