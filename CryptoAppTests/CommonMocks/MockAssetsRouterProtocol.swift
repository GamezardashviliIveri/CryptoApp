//
//  MockAssetsRouterProtocol.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation

final class MockAssetsRouterProtocol: AssetsRouterProtocol {
    var didCallShowAssetDetailsScreen = false
    var didCallPresentError = false
    
    func showAssetDetailsScreen(for: Coin) {
        didCallShowAssetDetailsScreen = true
    }
    
    func presentError(error: NetworkError) {
        didCallPresentError = true
    }
}
