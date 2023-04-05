//
//  ProductDetailView.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 03.04.2023.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel

    var body: some View {
        VStack {
            Text(viewModel.product?.name ?? "")
            Text(viewModel.productId.debugDescription)
            ReviewListView(reviews: viewModel.reviews)
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            viewModel: ProductDetailViewModel(
                productId: UUID(uuidString: "4e844471-3b4b-4593-b05f-2e7798c6ce80")!
            )
        )
    }
}
