//
//  MockAssetDetailsRouterProtocol.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation

final class MockAssetDetailsRouterProtocol: AssetDetailsRouterProtocol {
    var didCallPresentError = false
    func presentError(error: NetworkError) {
        didCallPresentError = true
    }
}
