//
//  NotificatuinCell.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI
import KingfisherSwiftUI

struct NotificatuinCell: View {
    @ObservedObject var viewModel: NotificationsCellViewModel
    
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false}
    
    init(viewModel: NotificationsCellViewModel) {
        self.viewModel = viewModel
    }
    
    @State private var showPostImage = true
    
    var body: some View {
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(destination: ProfileView(user: user)) {
                    KFImage(URL(string:  viewModel.notification.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    
                    Text(viewModel.notification.username).font(.system(size: 14, weight: .semibold)) +
                    Text(viewModel.notification.type.notificationMessage).font(.system(size: 15)) +
                    Text("\(viewModel.timestampString)").foregroundColor(.gray).font(.system(size: 12))
                }
            }
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(destination: FeedCell(viewModel: FeedCellViewModel(post: post))) {
                        KFImage(URL(string: post.imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipped()
                    }
                }
            } else {
                Button(action: {
                    isFollowed ? viewModel.unfollow() : viewModel.follow()
                }, label: {
                    Text(isFollowed ? "Following" : "Follow")
                        .font(.system(size: 14, weight: .semibold))
                        .frame(width: 172, height: 32)
                        .foregroundColor(isFollowed ? .black : .white)
                        .background(isFollowed ? Color.white : Color.blue)
                        .cornerRadius(3)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.gray, lineWidth: isFollowed ? 1 : 0)
                            
                        )
                })
            }
        }.padding(.horizontal)
    }
}

//struct NotificatuinCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificatuinCell()
//    }
//}
