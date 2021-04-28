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

    func testCreateURLForViewedTypeReturnsCorrectURL() {
        let result = sut.createURL(for: .viewed)
        XCTAssertEqual(result, URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=10se5TvsUG7aG7rr31AxOcme0SEZOQ9q"))
    }

    func testCreateURLForEmailedTypeReturnsCorrectURL() {
        let result = sut.createURL(for: .emailed)
        XCTAssertEqual(result, URL(string: "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=10se5TvsUG7aG7rr31AxOcme0SEZOQ9q"))
    }

    func testCreateURLForSharedTypeReturnsCorrectURL() {
        let result = sut.createURL(for: .shared)
        XCTAssertEqual(result, URL(string: "https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=10se5TvsUG7aG7rr31AxOcme0SEZOQ9q"))
    }

    func testValidCallToNYTMostViewedArticlesReturnStatusCode200() {
        guard let url = sut.createURL(for: .viewed) else {
            XCTFail("Invalid URL")
            return
        }

        let promise = expectation(description: "Status code: 200")
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                XCTFail("Error: \(error!.localizedDescription)")
                return
            }
            let statusCode = (response as! HTTPURLResponse).statusCode
            if statusCode == 200 {
                promise.fulfill()
            } else {
                XCTFail("Status code: \(statusCode)")
            }
        }

        dataTask.resume()

        self.waitForExpectations(timeout: 5, handler: nil)
    }

    func testValidCallToNYTMostEmailedArticlesWithXCTestExpectation() {
        guard let url = sut.createURL(for: .emailed) else {
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

