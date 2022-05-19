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
    
    func test_negative_didLoad() {
        let useCase = MockNegativeWorkshopProvider()
        let viewModel = AdvancedViewModel(usecase: useCase)
        let expectation = expectation(description: "should return error")

        viewModel.onErrorReceiveData = { msg in
            XCTAssertEqual(msg, "failed")
            expectation.fulfill()
        }
        
        viewModel.didLoad()
        waitForExpectations(timeout: 1)
        
    }
    
    func test_positive_click_sideEffect() {

        let useCase = MockPositiveWorkshopProvider()
        let viewModel = AdvancedViewModel(usecase: useCase)
        let loadExpectation = expectation(description: "should return product data")
        let tapTriggerExpectation = expectation(description: "should return side effect")
        let resultExpectation = MockProductData.generateProductResult().data

        viewModel.receiveData = {
            XCTAssertEqual(viewModel.products, resultExpectation)
            loadExpectation.fulfill()
        }
        
        viewModel.doSideEffect = { message in
            XCTAssertEqual(message, "something crazy \(resultExpectation[0].name)")
            tapTriggerExpectation.fulfill()
        }
        
        viewModel.didLoad()
        wait(for: [loadExpectation], timeout: 1)
        viewModel.didSelect(index: 0)
        wait(for: [tapTriggerExpectation], timeout: 1)
        
    }
    
    func test_negative_click_sideEffect() {

        let useCase = MockNegativeWorkshopProvider()
        let viewModel = AdvancedViewModel(usecase: useCase)
        let loadExpectation = expectation(description: "should return error")
        let tapTriggerExpectation = expectation(description: "should return error side effect")

        viewModel.onErrorReceiveData = { msg in
            XCTAssertEqual(msg, "failed")
            loadExpectation.fulfill()
        }
        
        viewModel.doSideEffect = { message in
            XCTAssertEqual(message, "error")
            tapTriggerExpectation.fulfill()
        }
        
        viewModel.didLoad()
        wait(for: [loadExpectation], timeout: 1)
        viewModel.didSelect(index: 0)
        wait(for: [tapTriggerExpectation], timeout: 1)
        
    }
    
    
}
