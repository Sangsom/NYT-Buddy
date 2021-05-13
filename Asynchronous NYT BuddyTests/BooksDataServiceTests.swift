//
//  BooksDataServiceTests.swift
//  Asynchronous NYT BuddyTests
//
//  Created by Rinalds Domanovs on 13/05/2021.
//

import XCTest

@testable import NYT_Buddy

class BooksDataServiceTests: XCTestCase {
    var sut: BooksDataService!

    override func setUp() {
        super.setUp()
        sut = BooksDataService()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCreateURLForMangaListReturnsCorrectURL() {
        let result = sut.createURL(for: "manga")
        XCTAssertEqual(result?.absoluteString, "https://api.nytimes.com/svc/books/v3/lists/manga.json?api-key=10se5TvsUG7aG7rr31AxOcme0SEZOQ9q")
    }

    func testValidCallToFetchOverviewReturnStatusCode200() {
        guard let url = sut.createURL() else {
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

    func testValidCallToFetchBooksByListReturnStatusCode200() {
        guard let url = sut.createURL(for: "combined-print-and-e-book-fiction") else {
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
}
