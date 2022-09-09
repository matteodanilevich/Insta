//
//  LazyView.swift
//  Instagram_Clone
//
//  Created by Mateo Danilevich on 9/7/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    
    let build:() -> Content
    
    init(build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content { build() }
}
