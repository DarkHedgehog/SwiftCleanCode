//
//  CircleShadow.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 13.01.2023.
//

import SwiftUI

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    func body(content: Content) -> some View {
        content
            .background(Circle()
            .fill(Color.white)
            .shadow(color: shadowColor, radius: shadowRadius))
    }
}
