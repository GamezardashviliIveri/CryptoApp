//
//  AssetDetailsPresenterTests.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation
import XCTest

final class AssetDetailsPresenterTests: XCTestCase {
    private var subjectUnderTest: AssetDetailsPresenter!
    private var mockAssetDetailsViewControllerProtocol: MockAssetDetailsViewControllerProtocol!
    private var mockAssetDetailsRouterProtocol: MockAssetDetailsRouterProtocol!
    private var mockFormDelegateProtocol: MockFormDelegateProtocol!
    private var mockFormDataSourceProtocol: MockFormDataSourceProtocol!
    private var mockAssetDetailsViewModelsBuilderFactoryProtocol: MockAssetDetailsViewModelsBuilderFactoryProtocol!
    
    
    override func setUp() {
        mockAssetDetailsViewControllerProtocol = MockAssetDetailsViewControllerProtocol()
        mockAssetDetailsRouterProtocol = MockAssetDetailsRouterProtocol()
        mockFormDelegateProtocol = MockFormDelegateProtocol()
        mockFormDataSourceProtocol = MockFormDataSourceProtocol()
        mockAssetDetailsViewModelsBuilderFactoryProtocol = MockAssetDetailsViewModelsBuilderFactoryProtocol()
        
        subjectUnderTest = AssetDetailsPresenter(
            viewController: mockAssetDetailsViewControllerProtocol,
            router: mockAssetDetailsRouterProtocol,
            coin: Coin(
                id: UUID().uuidString,
                symbol: UUID().uuidString,
                name: UUID().uuidString,
                image: UUID().uuidString,
                current_price: 1,
                price_change_percentage_24h: 1,
                sparkline_in_7d: Sparklines(price: [])
            ),
            formDelegate: mockFormDelegateProtocol,
            formDataSource: mockFormDataSourceProtocol,
            assetDetailsViewModelsBuilderFactory: mockAssetDetailsViewModelsBuilderFactoryProtocol
        )
    }
    
    func testViewDidLoad() {
        // When
        subjectUnderTest.viewDidLoad(coins: [])
        
        // Then
        XCTAssertTrue(mockFormDataSourceProtocol.didCallNotifyViewDidLoad)
        XCTAssertTrue(mockFormDelegateProtocol.didCallNotifyViewDidLoad)
        XCTAssertTrue(mockAssetDetailsViewModelsBuilderFactoryProtocol.didCallMake)
    }
    
    func test() {
        // When
        subjectUnderTest.interactorDidFailRetriveCoins(error: .invalidResponseCode)
        
        // Then
        XCTAssertTrue(mockAssetDetailsRouterProtocol.didCallPresentError)
    }
}
