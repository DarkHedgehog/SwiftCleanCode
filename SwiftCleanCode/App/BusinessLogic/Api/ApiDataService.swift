//
//  ApiDataService.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 20.03.2023.
//

import Foundation

final class ApiDataService {
    static let shared = ApiDataService()

    private var loggedProfile: User?

    private let requestFactory = RequestFactory()
    private lazy var auth = requestFactory.makeAuthRequestFatory()
    private lazy var catalogue = requestFactory.makeCatalogueRequestFatory()
    private lazy var reviews = requestFactory.makeReviewsRequestFatory()

    private init() { }

    public func getProfile() -> User? {
        return loggedProfile
    }

    public func login(userName: String, password: String, _ closure: @escaping (Bool) -> Void) {
        auth.login(userName: userName, password: password) { response in
            switch response.result {
            case .success(let result):
                if result.result != 1 {
                    self.loggedProfile = nil
                    DispatchQueue.main.async {
                        closure(false)
                    }
                } else {
                    self.loggedProfile = result.user
                    DispatchQueue.main.async {
                        closure(true)
                    }
                }
            case .failure(let error):
                print(error)
                self.loggedProfile = nil
                DispatchQueue.main.async {
                    closure(false)
                }
            }
        }
    }

    public func logout(_ closure: @escaping (Bool) -> Void) {
        loggedProfile = nil
        closure(true)
    }

    public func getProducts(_ closure: @escaping ([ProductShort]) -> Void) {
        catalogue.list(pageNumber: 0, categoryId: 0) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    closure(result)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    closure([])
                }
            }
        }
    }

    public func getProductDetail(id: UUID, _ closure: @escaping (ProductDetail?) -> Void) {
        catalogue.product(id: id) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    if let product = result.product {
                        closure(product)
                    } else {
                        closure(nil)
                    }
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    closure(nil)
                }
            }
        }
    }

    public func getReviewsForProduct(id: UUID, _ closure: @escaping ([Review]?) -> Void) {
        reviews.listForProduct(productId: id) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    closure(result.reviews)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    closure(nil)
                }
            }
        }
    }
}
