//
//  AssetsInteractorTests.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import UIKit
import XCTest

final class AssetsInteractorTests: XCTestCase {
    private var subjectUnderTest: AssetsInteractor!
    private var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        mockNetworkService = MockNetworkService()
        subjectUnderTest = AssetsInteractor(service: mockNetworkService)
    }
    
    func testLoadCoins() {
        // When
        subjectUnderTest.loadCoins(offset: 0, sortingType: .market, page: 1)
        
        // Then
        XCTAssertTrue(mockNetworkService.didCallPerformRequest)
    }
}
