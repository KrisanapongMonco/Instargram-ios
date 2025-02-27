//
//  LazyView.swift
//  IGEE
//
//  Created by 03 on 25/6/2566 BE.
//

import SwiftUI

struct LazyView<Content: View>:View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
