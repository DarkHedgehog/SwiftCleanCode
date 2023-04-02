//
//  BasketViewModel.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 29.03.2023.
//
import Foundation

class CartViewModel: ObservableObject {
    @Published var cart: UserCart?

    public func fetch() {
        ApiDataService.shared.getCart {  [weak self] result in
            self?.cart = result
        }
    }
}
