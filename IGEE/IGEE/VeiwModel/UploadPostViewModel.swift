//
//  UploadPostViewModel.swift
//  IGEE
//
//  Created by 03 on 24/6/2566 BE.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    
    func uploadPost(caption: String, image: UIImage, completion: FirestoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
//        guard let user = AuthViewModel.shared.currentUser, let userId = user.id else { return }

        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": user.id ?? "",
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUsername": user.username] as [String : Any]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
            
//            COLLECTION_POSTS.addDocument(data: data) { _ in
//                print("Debug : upload posts")
//            }
        }
    }
}
