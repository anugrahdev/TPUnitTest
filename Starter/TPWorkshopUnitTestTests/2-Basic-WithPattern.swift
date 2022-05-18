//
//  2-Basic-WithPattern.swift
//  TPWorkshopUnitTestTests
//
//  Created by digital.aurum on 18/11/21.
//

import XCTest
@testable import TPWorkshopUnitTest

class __Basic_WithPattern: XCTestCase {
    var viewModel: SecondBasicViewModel!
    
    override func setUp() {
        viewModel = SecondBasicViewModel()
    }
    
    func test_isEven_odd() {
        let expect = expectation(description: "check if isEven returning Ganjil")
        viewModel.resultOddEven = { result in
            XCTAssertEqual(result, "Ganjil")
            expect.fulfill()
        }
        
        viewModel.isEven(text: "33")
        waitForExpectations(timeout: 1)
    }
    
    func test_isEven_even() {
        let expect = expectation(description: "check if isEven returning Genap")
        viewModel.resultOddEven = { result in
            XCTAssertEqual(result, "Genap")
            expect.fulfill()
        }
        
        viewModel.isEven(text: "38")
        waitForExpectations(timeout: 1)
    }
    
    func test_numberFormatter_tens_withZero() {
        let expect = expectation(description: "number formatter return tens with zero")
        viewModel.resultNumberFormatter = { result in
            XCTAssertEqual(result, "Rp 109.787")
            expect.fulfill()
        }

        viewModel.numberFormatter(text: "109787")
        waitForExpectations(timeout: 1, handler: nil)
    }
}
