//
//  AuthViewModel.swift
//  IGEE
//
//  Created by 03 on 18/6/2566 BE.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var didSendResetPasswordLink = false
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fotchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Login failed \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fotchUser()
        }
    }
    
    func register(withEmail email: String, password: String, image: UIImage?, fullname: String, username: String) {
        
        guard let image = image else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else { return }
                print("Successfully resgistgered user...")
                
                let data = ["email":email,
                            "username": username,
                            "fullname": fullname,
                            "profileImageUrl": imageUrl,
                            "uid": user.uid]
                
                COLLECTION_USERS.document(user.uid).setData(data) { _ in
                    print("Successfully uploaded user data...")
                    
                    self.userSession = user
                    self.fotchUser()
                }
            }
        }
    }
    
    func signout() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword(withEmail email: String){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Failed ti send\(error.localizedDescription)")
                return
            }
            self.didSendResetPasswordLink = true
        }
    }
    
    func fotchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: Failed to fetch user \(error.localizedDescription)")
                return
            }
            
            guard let data = snapshot?.data() else { return }
            let user = User(
                username: data["username"] as? String ?? "",
                email: data["email"] as? String ?? "",
                profileImageUrl: data["profileImageUrl"] as? String ?? "",
                fullname: data["fullname"] as? String ?? "",
                id: uid,
                isFollowed: false
            )
            self.currentUser = user
        }
        //            guard let uid = userSession?.uid else {return}
        //            COLLECTION_USERS.document(uid).getDocument{ snapshot, _ in
        //                guard let dictionary = snapshot?.data() else { return }
        //                guard let username = dictionary["username"] as? String else { return }
        //                guard let email = dictionary["email"] as? String else { return }
        //                guard let profileImageUrl = dictionary["profileImageUrl"] as? String else { return }
        //                guard let fullname = dictionary["fullname"] as? String else { return }
        //                 let user = User(username: username, email: email , profileImageUrl: profileImageUrl, fullname: fullname)
        //                print("DEBUG: User is  \(user)")
        //                self.currentUser = user
        //            }
    }
    
}
