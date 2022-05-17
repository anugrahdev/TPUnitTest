//
//  1-Basic-WithoutPattern.swift
//  TPWorkshopUnitTestTests
//
//  Created by digital.aurum on 18/11/21.
//

import XCTest
@testable import TPWorkshopUnitTest

class __Basic_WithoutPattern: XCTestCase {
    var vc: FirstBasicViewController!
    
    override func setUp() {
        vc = FirstBasicViewController(nibName: "FirstBasicViewController", bundle: nil)
    }
    
    override func tearDown() {
        vc = nil
    }
    
    func test_ifEven_odd() {
        let isOdd = vc.isEven(number: 15)
        XCTAssertFalse(isOdd)
    }
    
    func test_ifEven_even() {
        let isEven = vc.isEven(number: 10)
        XCTAssertTrue(isEven)
    }
    
    func test_numberFormatter_tens() {
        let formattedNumber = vc.numberFormatter(number: 17, separator: ".", currency: "Rp")
        XCTAssertEqual(formattedNumber, "Rp 17")
    }
    
    func test_numberFormatter_hundred() {
        let formattedNumber = vc.numberFormatter(number: 170, separator: ".", currency: "Rp")
        XCTAssertEqual(formattedNumber, "Rp 170")
    }
    
    func test_numberFormatter_thousand() {
        let formattedNumber = vc.numberFormatter(number: 1700, separator: ".", currency: "Rp")
        XCTAssertEqual(formattedNumber, "Rp 1.700")
    }
    
    func test_numberFormatter_ten_thousand() {
        let formattedNumber = vc.numberFormatter(number: 17430, separator: ".", currency: "Rp")
        XCTAssertEqual(formattedNumber, "Rp 17.430")
    }
    
    func test_numberFormatter_hundred_thousand() {
        let formattedNumber = vc.numberFormatter(number: 117430, separator: ".", currency: "Rp")
        XCTAssertEqual(formattedNumber, "Rp 117.430")
    }
    
    func test_numberFormatter_milion() {
        let formattedNumber = vc.numberFormatter(number: 1717430, separator: ".", currency: "Rp")
        XCTAssertEqual(formattedNumber, "Rp 1.717.430")
    }
    
    func test_numberFormatter_dollar() {
        let formattedNumber = vc.numberFormatter(number: 234523543, separator: ".", currency: "$")
        XCTAssertEqual(formattedNumber, "$ 234.523.543")
    }
}
