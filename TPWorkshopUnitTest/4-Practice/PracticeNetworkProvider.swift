//
//  PracticeNetworkProvider.swift
//  TPWorkshopUnitTest
//
//  Created by digital.aurum on 23/11/21.
//

import Foundation

protocol PracticeNetworkProvider {
    func fetchProduct(onComplete: @escaping (NetworkResult<ProductResult>) -> Void)
    func fetchInspiration(onComplete: @escaping (NetworkResult<InspirationResult>) -> Void)
    func fetchTicker(onComplete: @escaping (NetworkResult<Ticker>) -> Void)
}

struct PracticeUseCase: PracticeNetworkProvider {
    func fetchProduct(onComplete: @escaping (NetworkResult<ProductResult>) -> Void) {
        guard let url = Bundle.main.path(forResource: "ProductData", ofType: "json") else {
            onComplete(.failed("URL Not found"))
            return
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: url), options: .mappedIfSafe) {
            if let result = try? JSONDecoder().decode(ProductResult.self, from: data) {
                onComplete(.success(result))
            } else {
                onComplete(.failed("Failed when decoding"))
            }
        } else {
            onComplete(.failed("Failed converting to data"))
        }
    }
    
    func fetchInspiration(onComplete: @escaping (NetworkResult<InspirationResult>) -> Void) {
        guard let url = Bundle.main.path(forResource: "InspirationData", ofType: "json") else {
            onComplete(.failed("URL Not found"))
            return
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: url), options: .mappedIfSafe) {
            if let result = try? JSONDecoder().decode(InspirationResult.self, from: data) {
                onComplete(.success(result))
            } else {
                onComplete(.failed("Failed when decoding"))
            }
        } else {
            onComplete(.failed("Failed converting to data"))
        }
    }
    
    func fetchTicker(onComplete: @escaping (NetworkResult<Ticker>) -> Void) {
        guard let url = Bundle.main.path(forResource: "TickerData", ofType: "json") else {
            onComplete(.failed("URL Not found"))
            return
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: url), options: .mappedIfSafe) {
            if let result = try? JSONDecoder().decode(Ticker.self, from: data) {
                onComplete(.success(result))
            } else {
                onComplete(.failed("Failed when decoding"))
            }
        } else {
            onComplete(.failed("Failed converting to data"))
        }
    }
}