//
//  3-Advanced-Standard.swift
//  TPWorkshopUnitTestTests
//
//  Created by digital.aurum on 18/11/21.
//

import XCTest
@testable import TPWorkshopUnitTest

class __Advanced: XCTestCase {
    
    func test_positive_didLoad() {
        let useCase = MockPositiveWorkshopProvider()
        let viewModel = AdvancedViewModel(usecase: useCase)
        let expectation = expectation(description: "should return product data")
        let resultExpectation = MockProductData.generateProductResult().data

        viewModel.receiveData = {
            XCTAssertEqual(viewModel.products, resultExpectation)
            expectation.fulfill()
        }
        
        viewModel.didLoad()
        waitForExpectations(timeout: 1)
    }
    
}
