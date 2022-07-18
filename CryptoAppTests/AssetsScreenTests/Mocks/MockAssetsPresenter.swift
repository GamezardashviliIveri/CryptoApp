//
//  MockAssetsPresenter.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation

final class MockAssetsPresenter: AssetsPresenterProtocol {
    var didCallInteractorDidRetriveCoins = false
    var didCallInteractorDidFailRetriveCoins = false
    
    func interactorDidRetriveCoins(_ coins: [Coin], shouldScrollToTop: Bool) {
        didCallInteractorDidRetriveCoins = true
    }
    
    func interactorDidFailRetriveCoins(_ error: NetworkError) {
        didCallInteractorDidFailRetriveCoins = true
    }
}
