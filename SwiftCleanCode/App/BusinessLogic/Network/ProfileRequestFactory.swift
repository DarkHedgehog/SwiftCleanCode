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
        userId: Int,
        userName: String,
        password: String,
        email: String,
        gender: String,
        creditCard: String,
        bio: String,
        completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void
    )
}
