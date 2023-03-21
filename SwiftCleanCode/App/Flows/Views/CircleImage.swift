//
//  CircleImage.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 13.01.2023.
//

import SwiftUI

struct CircleImage: View {
    var name: String
    var diameter: CGFloat
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .frame(width: diameter, height: diameter)
            .cornerRadius(diameter / 2)
            .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 5))
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(name: "DarkHedgehog", diameter: 80)
    }
}
