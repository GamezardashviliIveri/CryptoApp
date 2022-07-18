//
//  MockAssetsViewModelsBuilderFactoryProtocol.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation

final class MockAssetsViewModelsBuilderProtocol: AssetsViewModelsBuilderProtocol {
    var didCallBuild = false
    var didCallAddAssetFields = false
    
    func build() -> [CellViewModelProtocol] {
        didCallBuild = true
        return []
    }
    
    func addAssetFields(coins: [Coin]) -> AssetsViewModelsBuilderProtocol {
        didCallAddAssetFields = true
        return self
    }
}

final class MockAssetsViewModelsBuilderFactoryProtocol: AssetsViewModelsBuilderFactoryProtocol {
    var didCallMake = false
    func make(actionsHandler: AssetsActionsHandler) -> AssetsViewModelsBuilderProtocol {
        didCallMake = true
        return MockAssetsViewModelsBuilderProtocol()
    }
}
