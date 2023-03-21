//
//  BounceAnimation.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 07.02.2023.
//

import SwiftUI

struct BounceAnimation: ViewModifier {
    @State var isScaled = false
    func body(content: Content) -> some View {
        content
            .scaleEffect(isScaled ? 1.25 : 1)
            .animation(.interpolatingSpring(stiffness: 350, damping: 5, initialVelocity: 10), value: isScaled)
            .onTapGesture {
                bounceAnimation()
            }
    }
    func bounceAnimation() {
        isScaled = true
        withAnimation(.interpolatingSpring(stiffness: 350, damping: 5, initialVelocity: 10).delay(0)) {
            isScaled = false
        }
    }
}
