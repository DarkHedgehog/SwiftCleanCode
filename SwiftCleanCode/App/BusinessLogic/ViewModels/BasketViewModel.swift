//
//  BasketViewModel.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 29.03.2023.
//
import Foundation

class BasketViewModel: ObservableObject {
    @Published var products: [ProductShort] = []

    public func fetch() {
        ApiDataService.shared.getProducts {  [weak self] result in
            self?.products = result
        }
    }
}
