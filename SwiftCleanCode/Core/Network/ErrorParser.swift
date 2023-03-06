//
//  ErrorParser.swift
//  SwiftCleanCode
//
//  Created by Aleksandr Derevenskih on 02.03.2023.
//

import Foundation

class ErrorParser: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
