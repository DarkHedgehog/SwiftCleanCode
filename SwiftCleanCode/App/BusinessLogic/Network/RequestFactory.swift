//
//  RequestFactory.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.03.2023.
//

import Foundation
import Alamofire

class RequestFactory {
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    let sessionQueue = DispatchQueue.global(qos: .utility)

    func makeErrorParser() -> AbstractErrorParser {
        return ErrorParser()
    }

    func makeAuthRequestFatory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }

    func makeProfileRequestFatory() -> ProfileRequestFactory {
        let errorParser = makeErrorParser()
        return Profile(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
