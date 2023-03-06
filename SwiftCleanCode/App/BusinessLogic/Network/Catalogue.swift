//
//  Catalogue.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import Foundation

import Foundation
import Alamofire

class Catalogue: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)
    ) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Catalogue: CatalogueRequestFactory {
    func list(
        pageNumber: Int,
        categoryId: Int,
        completionHandler: @escaping (Alamofire.AFDataResponse<[Product]>) -> Void
    ) {
        let requestModel = CatalogueList(
            baseUrl: baseUrl,
            pageNumber: pageNumber,
            categoryId: categoryId
        )

        self.request(request: requestModel, completionHandler: completionHandler)
    }

//    func edit(
//        userId: Int,
//        userName: String,
//        password: String,
//        email: String,
//        gender: String,
//        creditCard: String,
//        bio: String,
//        completionHandler: @escaping (Alamofire.AFDataResponse<EditProfileResult>) -> Void
//    ) {
//        let requestModel = EditProfile(
//            baseUrl: baseUrl,
//            idUser:         userId,
//            userName: userName,
//            password: password,
//            email: email,
//            gender: gender,
//            creditCard: creditCard,
//            bio: bio
//        )
//
//        self.request(request: requestModel, completionHandler: completionHandler)
//    }
}

extension Catalogue {
    struct CatalogueList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        let pageNumber: Int
        let categoryId: Int
        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }

//    struct EditProfile: RequestRouter {
//        let baseUrl: URL
//        let method: HTTPMethod = .get
//        let path: String = "changeUserData.json"
//        let idUser: Int
//        let userName: String
//        let password: String
//        let email: String
//        let gender: String
//        let creditCard: String
//        let bio: String
//        var parameters: Parameters? {
//            return [
//                "id_user": 123,
//                "username": userName,
//                "password": password,
//                "email": email,
//                "gender": gender,
//                "credit_card": creditCard,
//                "bio": bio
//            ]
//        }
//    }
}
