//
//  LazyView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 24.03.2022.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init (_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: some View {
        build()
    }
}

