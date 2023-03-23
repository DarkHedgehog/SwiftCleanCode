//
//  Registration.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.03.2023.
//

import Foundation
import Alamofire

class Profile: AbstractRequestFactory {
    let errorParser: AbstractErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = NetworkConfig.baseUrl
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

extension Profile: ProfileRequestFactory {
    func registration(
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (Alamofire.AFDataResponse<RegistrationResult>) -> Void
    ) {
        let requestModel = Registration(
            baseUrl: baseUrl,
            userName: userName,
            password: password,
            email: email,
            gender: gender,
            creditCard: creditCard,
            bio: bio
        )

        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func edit(
        userId: UUID,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (Alamofire.AFDataResponse<EditProfileResult>) -> Void
    ) {
        let requestModel = EditProfile(
            baseUrl: baseUrl,
            idUser: userId,
            userName: userName,
            password: password,
            email: email,
            gender: gender,
            creditCard: creditCard,
            bio: bio
        )

        self.request(request: requestModel, completionHandler: completionHandler)
    }

    func read(userId: UUID, completionHandler: @escaping (Alamofire.AFDataResponse<ReadProfileResult>) -> Void) {

        let requestModel = ReadProfile(
            baseUrl: baseUrl,
            idUser: userId
        )

        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Profile {
    struct Registration: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = NetworkConfig.registerPoint
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }

    struct EditProfile: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .post
        let path: String = NetworkConfig.editProfilePoint
        let idUser: UUID
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id": idUser,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio": bio
            ]
        }
    }

    struct ReadProfile: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = NetworkConfig.readProfilePoint
        let idUser: UUID
        var parameters: Parameters? {
            return [
                "id": idUser,
            ]
        }
    }
}
