//
//  TopStoriesDataServiceTests.swift
//  Asynchronous NYT BuddyTests
//
//  Created by Rinalds Domanovs on 28/04/2021.
//

import XCTest

class TopStoriesDataServiceTests: XCTestCase {
    var sut: TopStoriesDataService!

    override func setUp() {
        super.setUp()
        sut = TopStoriesDataService()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testCreateURLForArtsSectionReturnsCorrectURL() {
        let result = sut.createURL(for: .arts)
        XCTAssertEqual(result, URL(string: "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=10se5TvsUG7aG7rr31AxOcme0SEZOQ9q"))
    }

    func testCreateURLForNyregionSectionReturnsCorrectURL() {
        let result = sut.createURL(for: .nyregion)
        XCTAssertEqual(result, URL(string: "https://api.nytimes.com/svc/topstories/v2/nyregion.json?api-key=10se5TvsUG7aG7rr31AxOcme0SEZOQ9q"))
    }

    func testValidCallToTopStoriesReturnStatusCode200() {
        guard let url = sut.createURL(for: .books) else {
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
