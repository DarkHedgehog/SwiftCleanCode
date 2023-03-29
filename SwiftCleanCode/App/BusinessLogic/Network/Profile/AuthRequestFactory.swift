//
//  AuthRequestFactory.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.03.2023.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(
        userName: String,
        password: String,
        completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void
    )

    func logout(userId: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void)
}
