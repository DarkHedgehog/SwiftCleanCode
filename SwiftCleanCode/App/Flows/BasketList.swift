//
//  UserList.swift
//  SwiftUILessons
//
//  Created by Aleksandr Derevenskih on 13.01.2023.
//

import SwiftUI

struct BasketList: View {
    @ObservedObject var viewModel: CartViewModel

    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(viewModel.cart?.products ?? []) { product in
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
            if viewModel.cart?.products.count ?? 0 > 0 {
                HStack {
                    Text("Total")
                    Spacer()
                    Text("\((viewModel.cart?.totalCost ?? 0.0).formatted())")
                }.padding()
                HStack {
                    Text("Balance")
                    Spacer()
                    Text("\((viewModel.cart?.balance ?? 0.0).formatted())")
                }.padding()

                Button {

                } label: {
                    Text("Buy all")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .padding()
            }
        }
        .onAppear(perform: viewModel.fetch)
    }
}
