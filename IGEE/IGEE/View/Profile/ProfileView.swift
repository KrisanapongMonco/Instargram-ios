//
//  ProfileView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var uid: String?
    let postID: String?
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User, postID: String? = nil) {
        self.user = user
        self.postID = postID
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                ProfileHeaderView(viewModel: viewModel)
                
                if let postID = postID {
                    PostGridView(config: .profile(user.id ?? ""), postID: postID)
                } else {
                    PostGridView(config: .profile(user.id ?? ""))
                }
            }.padding(.top)
        }
    }
}


//struct ProfileView: View {
//    let user: User
//    var uid: String?
//    @ObservedObject var viewModel: ProfileViewModel
//
//    init(user: User) {
//        self.user = user
//        self.viewModel = ProfileViewModel(user: user)
//    }
//
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 32) {
//                ProfileHeaderView(viewModel: viewModel)
//
//                PostGridView(config: .profile(user.id ?? ""))
//            }.padding(.top)
//        }
//    }
//}

//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}
