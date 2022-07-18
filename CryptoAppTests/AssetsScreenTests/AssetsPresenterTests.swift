//
//  AssetsPresenterTests.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation
import XCTest

final class AssetsPresenterTests: XCTestCase {
    private var subjectUnderTest: AssetsPresenter!
    private var mockFormDelegateProtocol: MockFormDelegateProtocol!
    private var mockFormDataSourceProtocol: MockFormDataSourceProtocol!
    private var mockAssetsRouterProtocol: MockAssetsRouterProtocol!
    private var mockAssetsViewModelsBuilderFactoryProtocol: MockAssetsViewModelsBuilderFactoryProtocol!
    
    override func setUp() {
        mockFormDelegateProtocol = MockFormDelegateProtocol()
        mockFormDataSourceProtocol = MockFormDataSourceProtocol()
        mockAssetsRouterProtocol = MockAssetsRouterProtocol()
        mockAssetsViewModelsBuilderFactoryProtocol = MockAssetsViewModelsBuilderFactoryProtocol()
        
        subjectUnderTest = AssetsPresenter(
            formDelegate: mockFormDelegateProtocol,
            formDataSource: mockFormDataSourceProtocol,
            router: mockAssetsRouterProtocol,
            assetsViewModelsBuilderFactory: mockAssetsViewModelsBuilderFactoryProtocol
        )
    }
    
    func testInteractorDidRetriveCoins() {
        // When
        subjectUnderTest.interactorDidRetriveCoins([], shouldScrollToTop: false)
        
        // Then
        XCTAssertTrue(mockFormDataSourceProtocol.didCallNotifyViewDidLoad)
        XCTAssertTrue(mockFormDelegateProtocol.didCallNotifyViewDidLoad)
        XCTAssertTrue(mockAssetsViewModelsBuilderFactoryProtocol.didCallMake)
    }
    
    func testInteractorDidRetriveCoinsError() {
        // When
        subjectUnderTest.interactorDidFailRetriveCoins(.invalidResponseCode)
        
        // Then
        XCTAssertTrue(mockAssetsRouterProtocol.didCallPresentError)
    }
}
