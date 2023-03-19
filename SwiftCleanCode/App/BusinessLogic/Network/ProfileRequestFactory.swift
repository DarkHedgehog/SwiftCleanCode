//
//  RegistrationRequestFactory.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.03.2023.
//

import Foundation
import Alamofire

protocol ProfileRequestFactory {
    func registration(
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void
    )

    func edit(
        userId: UUID,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (Alamofire.AFDataResponse<EditProfileResult>) -> Void
    )
}
