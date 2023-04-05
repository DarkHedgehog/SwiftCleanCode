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
    private lazy var cart = requestFactory.makeCartRequestFatory()

    private init() { }

    public func getProfile() -> User? {
        return loggedProfile
    }

    public func login(userName: String, password: String, _ completion: @escaping (Bool) -> Void) {
        auth.login(userName: userName, password: password) { response in
            switch response.result {
            case .success(let result):
                if result.result != 1 {
                    self.loggedProfile = nil
                    DispatchQueue.main.async {
                        completion(false)
                    }
                } else {
                    self.loggedProfile = result.user
                    DispatchQueue.main.async {
                        completion(true)
                    }
                }
            case .failure(let error):
                print(error)
                self.loggedProfile = nil
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }

    public func logout(_ completion: @escaping (Bool) -> Void) {
        loggedProfile = nil
        completion(true)
    }

    public func getProducts(_ completion: @escaping ([ProductShort]) -> Void) {
        catalogue.list(pageNumber: 0, categoryId: 0) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    completion(result)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }
    }

    public func getProductDetail(id: UUID, _ completion: @escaping (ProductDetail?) -> Void) {
        catalogue.product(id: id) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    if let product = result.product {
                        completion(product)
                    } else {
                        completion(nil)
                    }
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    public func getReviewsForProduct(id: UUID, _ completion: @escaping ([Review]?) -> Void) {
        reviews.listForProduct(productId: id) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    completion(result.reviews)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    public func getCart(_ completion: @escaping (UserCart?) -> Void) {
        guard let userId = loggedProfile?.id else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }
        cart.getCart(userId: userId) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    completion(result.cart)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

    public func cartAdd(productId: UUID, _ completion: @escaping (Bool) -> Void) {
        guard let userId = loggedProfile?.id else {
            DispatchQueue.main.async {
                completion(false)
            }
            return
        }
        cart.addProductToCart(userId: userId, productId: productId) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    completion(true)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }

    public func cartRemove(productId: UUID, _ completion: @escaping (Bool) -> Void) {
        guard let userId = loggedProfile?.id else {
            DispatchQueue.main.async {
                completion(false)
            }
            return
        }
        cart.removeProductFromCart(userId: userId, productId: productId) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    completion(true)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(false)
                }
            }
        }
    }

    public func cartPayForAll(_ completion: @escaping (UserCart?) -> Void) {
        guard let userId = loggedProfile?.id else {
            DispatchQueue.main.async {
                completion(nil)
            }
            return
        }

        cart.cartPayForAll(userId: userId, sign: "i swear") { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    completion(result.cart)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
