//
//  AssetsRouter.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

protocol AssetsRouterProtocol {
    func showAssetDetailsScreen(for: Coin)
    func presentError(error: NetworkError)
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
    
    func presentError(error: NetworkError) {
        let alert = UIAlertController(title: "Error", message: error.errorDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.viewController.navigationController?.present(alert, animated: false)
    }
}
