//
//  MostPopularViewModelTests.swift
//  NYT BuddyTests
//
//  Created by Rinalds Domanovs on 25/04/2021.
//

import XCTest

@testable import NYT_Buddy

class MostPopularViewModelTests: XCTestCase {
    private var sut: MostPopularViewModel!

    override func setUp() {
        super.setUp()
        sut = MostPopularViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testArticlesStartsEmpty() {
        let result = sut.articles.count
        XCTAssertEqual(result, 0)
    }

    func testSelectedPeriodStartsWithDailyRawValue() {
        let result = sut.selectedPeriod
        XCTAssertEqual(result, Period.daily.rawValue)
    }

    func testStateStartsIdle() {
        let result = sut.state
        XCTAssertEqual(result, .idle)
    }
}
