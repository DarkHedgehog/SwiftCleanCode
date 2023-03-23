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
        List {
            ForEach(viewModel.products) { product in
                HStack {
                    Text(product.name)
                    Spacer()
                    Text("\(product.price.formatted())")
                }
            }
        }
        .onAppear {
            viewModel.fetch()
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
