//
//  BasketListDetailView.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 03.04.2023.
//

import SwiftUI

struct BasketListDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ProductDetailViewModel

    var body: some View {
        VStack {
            ProductDetailView(viewModel: viewModel)

            Spacer()

            Button(action: removeProductAction) {
                Text("Remove from cart")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .foregroundColor(.red)
            .padding()
        }
        .onAppear {
            viewModel.fetch()
            AppAnalythics.shared.logEvent(.productOpened(viewModel.productId))
        }
    }

    private func removeProductAction() {
        ApiDataService.shared.cartRemove(productId: viewModel.productId) { result in
            AppAnalythics.shared.logEvent(.tryRemoveFromCart(viewModel.productId))
            if result {
                AppAnalythics.shared.logEvent(.removeFromCart(viewModel.productId))
                dismiss()
            }
            viewModel.fetch()
        }
    }
}

struct BasketListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BasketListDetailView(
            viewModel: ProductDetailViewModel(
                productId: UUID(uuidString: "4e844471-3b4b-4593-b05f-2e7798c6ce80")!
            )
        )
    }
}
