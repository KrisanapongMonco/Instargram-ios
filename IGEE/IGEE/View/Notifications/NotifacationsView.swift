//
//  NotifacationsView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI

struct NotifacationsView: View {
    @ObservedObject var viewModel = NotificationsViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20){
                ForEach(viewModel.notifications) { notification in
                    NotificatuinCell(viewModel: NotificationsCellViewModel(notification: notification))
                        .padding(.top)
                }
            }
        }
    }
}

struct NotifacationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotifacationsView()
    }
}
