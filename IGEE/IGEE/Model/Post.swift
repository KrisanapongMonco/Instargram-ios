//
//  Post.swift
//  IGEE
//
//  Created by 03 on 24/6/2566 BE.
//

import FirebaseFirestoreSwift
import Firebase

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    let ownerUsername: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    let ownerImageUrl: String
//    private enum CodingKeys: CodingKeys {
//        case ownerUid = "uid"
//    }

    var didLike: Bool? = false
}
