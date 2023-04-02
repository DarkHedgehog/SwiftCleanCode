//
//  ProductDetail.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 24.03.2023.
//

import SwiftUI

struct ProductDetailView: View {
    @ObservedObject var viewModel: ProductDetailViewModel

    @State var isAddedMessagePresented = false
    @State var isErrorMessagePresented = false

    var body: some View {
        VStack {
            Text(viewModel.product?.name ?? "")
            Text(viewModel.productId.debugDescription)
            ReviewListView(reviews: viewModel.reviews)

            Spacer()

            Button(action: addProductAction) {
                Text("Add to cart")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .onAppear {
            viewModel.fetch()
            AppAnalythics.shared.logEvent(.productOpened(viewModel.productId))
        }
        .alert(isPresented: $isAddedMessagePresented) {
            Alert(
                title: Text("Added"),
                message: Text("Product added to Your cart")
            )
        }
        .alert(isPresented: $isErrorMessagePresented) {
            Alert(
                title: Text("Error"),
                message: Text("Cant add product")
            )
        }
    }

    private func addProductAction() {
        ApiDataService.shared.cartAdd(productId: viewModel.productId) { result in
            AppAnalythics.shared.logEvent(.tryAddToCart(viewModel.productId))
            if result {
                AppAnalythics.shared.logEvent(.addToCart(viewModel.productId))
                isAddedMessagePresented = true
            } else {
                isErrorMessagePresented = true
            }
        }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            viewModel: ProductDetailViewModel(
                productId: UUID(uuidString: "4e844471-3b4b-4593-b05f-2e7798c6ce80")!
            )
        )
    }
}
