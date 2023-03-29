//
//  ReviewListView.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 27.03.2023.
//

import SwiftUI

struct ReviewListView: View {
    var reviews: [Review] = []

    var body: some View {
        List {
            ForEach(reviews) { review in
                Text(review.text)
            }
        }
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListView()
    }
}
