//
//  MostPopularDataServiceTests.swift
//  Asynchronous NYT BuddyTests
//
//  Created by Rinalds Domanovs on 25/04/2021.
//

import XCTest

@testable import NYT_Buddy

class MostPopularDataServiceTests: XCTestCase {
    var sut: MostPopularDataService!

    override func setUp() {
        super.setUp()
        sut = MostPopularDataService(period: Period.daily.rawValue)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCreateURLReturnsCorrectURL() {
        let result = sut.createURL()
        XCTAssertEqual(result, URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=10se5TvsUG7aG7rr31AxOcme0SEZOQ9q"), "URL is created incorrectly")
    }

    func testValidCallToNYTReturnStatusCode200() {
        guard let url = sut.createURL() else {
            XCTFail("Invalid URL")
            return
        }

        var httpResponse: HTTPURLResponse?
        var responseError: Error?
        let promise = expectation(description: "Completion handler invoked")
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in

            httpResponse = response as? HTTPURLResponse
            responseError = error
            promise.fulfill()

            XCTAssertNil(responseError)
            XCTAssertEqual(httpResponse?.statusCode, 200)
        }

        dataTask.resume()

        self.waitForExpectations(timeout: 5, handler: nil)
    }
}

