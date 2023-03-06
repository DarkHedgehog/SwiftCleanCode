//
//  ResponseCodable.swift
//  SwiftCleanCodeTests
//
//  Created by Aleksandr Derevenskih on 06.03.2023.
//

import XCTest
import Alamofire
@testable import SwiftCleanCode


struct PostStub: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
enum ApiErrorStub: Error {
    case fatalError
}
struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}


final class ResponseCodableTests: XCTestCase {
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!

    override func setUpWithError() throws {
        super.setUp()
        errorParser = ErrorParserStub()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        errorParser = nil
    }

    func testShouldDownloadAndParse() {
        let errorParser = ErrorParserStub()
        AF
            .request( URL(string: "https://jsonplaceholder.typicode.com/posts/1")!)
            .responseCodable(errorParser: errorParser) {
                (response: AFDataResponse<PostStub>) in
                switch response.result {
                case .success(_): break
                case .failure: XCTFail()
                }
                self.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }

    func testExample() throws {
    }

    func testPerformanceExample() throws {
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
