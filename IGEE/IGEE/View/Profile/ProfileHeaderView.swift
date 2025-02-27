//
//  ProfileHeaderView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI
import KingfisherSwiftUI

struct ProfileHeaderView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                KFImage(URL(string: viewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    
                    //                    if let state = viewModel.user.stats {
                    //                        UserStatView(value: state.posts, title: "Post")
                    //                        UserStatView(value: state.followers, title: "Followers")
                    //                        UserStatView(value: state.following, title: "Following")
                    //                    }
                    
                    UserStatView(value: viewModel.user.stats?.posts ?? 0, title: "Post")
                    UserStatView(value: viewModel.user.stats?.followers ?? 0, title: "Followers")
                    UserStatView(value: viewModel.user.stats?.following ?? 0, title: "Following")
                }.padding(.trailing, 32)
                
            }
            Text(viewModel.user.fullname)
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
//            Text("Gotha,'s Dark Knight")
//                .font(.system(size: 15))
//                .padding(.leading)
//                .padding(.top, 1)
            
            if let bio = viewModel.user.bio {
                Text(bio)
                    .font(.system(size: 15))
                    .padding(.leading)
                    .padding(.top, 1)
            }
            
            HStack {
                
                Spacer()
                
                ProfileActionButtonView(viewModel: viewModel)
                
                Spacer()
            }.padding(.top)
        }
    }
}


//struct ProfileHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileHeaderView()
//    }
//}
