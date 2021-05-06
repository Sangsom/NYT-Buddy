//
//  PeriodTests.swift
//  NYT BuddyTests
//
//  Created by Rinalds Domanovs on 25/04/2021.
//

import XCTest

@testable import NYT_Buddy

class PeriodTests: XCTestCase {
    var daily: Period { .daily }
    var weekly: Period { .weekly }

    func testPeriodWithoutAssociatedValue() throws {
        let result = daily
        XCTAssertEqual(result, .daily)
    }

    func testPeriodIdProperty() {
        let result = daily.rawValue
        XCTAssertEqual(result, 1, "Daily id is not 1")
    }

    func testPeriodStringValueReturns1Day() {
        let result = daily.stringValue
        XCTAssertEqual(result, "1 day")
    }

    func testPeriodStringValueReturns7Days() {
        let result = weekly.stringValue
        XCTAssertEqual(result, "7 days")
    }
}
