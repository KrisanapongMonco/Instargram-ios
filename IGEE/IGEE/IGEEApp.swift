//
//  IGEEApp.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI
import Firebase

@main
struct IGEEApp: App {
       
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
//            LoginView().environmentObject(AuthViewModel())
        }
    }
}
