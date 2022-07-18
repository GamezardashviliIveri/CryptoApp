//
//  MockAssetDetailsViewControllerProtocol.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation

final class MockAssetDetailsViewControllerProtocol: AssetDetailsViewControllerProtocol {
    var didCallDidReachToTheEnd = false
    
    func didReachToTheEnd() {
        didCallDidReachToTheEnd = true
    }
}
