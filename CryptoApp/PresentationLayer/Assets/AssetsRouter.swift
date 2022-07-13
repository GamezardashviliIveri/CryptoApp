//
//  AssetsRouter.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

protocol AssetsRouterProtocol {
    func showAssetDetailsScreen(for: Coin)
}

final class AssetsRouter: AssetsRouterProtocol {
    weak var viewController: UIViewController!
    private let assetDetailsViewControllerFactory: AssetDetailsViewControllerFactoryProtocol
    
    init(assetDetailsViewControllerFactory: AssetDetailsViewControllerFactoryProtocol) {
        self.assetDetailsViewControllerFactory = assetDetailsViewControllerFactory
    }
    
    func showAssetDetailsScreen(for coin: Coin) {
        let assetDetailsViewController = assetDetailsViewControllerFactory.make(coin: coin)
        self.viewController.navigationController?.pushViewController(assetDetailsViewController, animated: true)
    }
}
