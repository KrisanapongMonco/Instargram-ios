//
//  UserCell.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI
import KingfisherSwiftUI

struct UserCell: View {
    let user: User

    var body: some View {
        HStack {
            
            // image
            KFImage(URL(string: user.profileImageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())

            // VStack -> username, fullname
            
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.system(size: 14, weight: .semibold))
                Text(user.fullname)
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
