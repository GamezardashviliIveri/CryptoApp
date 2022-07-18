//
//  MockAssetDetailsViewModelsBuilderFactoryProtocol.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation

final class MockAssetDetailsViewModelsBuilderProtocol: AssetDetailsViewModelsBuilderProtocol {
    var didCallVuild = false
    var didCallAddHeader = false
    var didCallAddGraph = false
    var didCallAddAssets = false
    
    
    
    func build() -> [CellViewModelProtocol] {
        didCallVuild = true
        return []
    }
    
    func addHeader(title: String, subtitle: Float?, change: Float?, imageUrl: String) -> AssetDetailsViewModelsBuilderProtocol {
        didCallAddHeader = true
        return self
    }
    
    func addGraph(sparkline: [String]) -> AssetDetailsViewModelsBuilderProtocol {
        didCallAddGraph = true
        return self
    }
    
    func addAssets(coins: [Coin]) -> AssetDetailsViewModelsBuilderProtocol {
        didCallAddAssets = true
        return self
    }
}

final class MockAssetDetailsViewModelsBuilderFactoryProtocol: AssetDetailsViewModelsBuilderFactoryProtocol {
    var didCallMake = false
    
    func make(actionsHandler: AssetDetailsActionsHandler) -> AssetDetailsViewModelsBuilderProtocol {
        didCallMake = true
        return MockAssetDetailsViewModelsBuilderProtocol()
    }
}
