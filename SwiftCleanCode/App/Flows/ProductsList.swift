//
//  ProductsList.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 21.03.2023.
//

import SwiftUI

struct ProductsList: View {
    @ObservedObject var viewModel: ProductsViewModel

    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.products) { product in
                    NavigationLink(destination: {
                        ProductDetailView(viewModel: ProductDetailViewModel(productId: product.id))
                    }, label: {
                        HStack {
                            Text(product.name)
                            Spacer()
                            Text("\(product.price.formatted())")
                        }
                    })
                }
            }
        }
        .onAppear {
            viewModel.fetch()
            AppAnalythics.shared.logEvent(.productListOpened)
        }
    }
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList(
            viewModel: ProductsViewModel()
        )
    }
}
