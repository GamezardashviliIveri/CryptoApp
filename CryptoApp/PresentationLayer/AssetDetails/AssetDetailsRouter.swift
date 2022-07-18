//
//  AssetDetailsRouter.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/13/22.
//

import UIKit

protocol AssetDetailsRouterProtocol {
    func presentError(error: NetworkError)
}

final class AssetDetailsRouter: AssetDetailsRouterProtocol {
    weak var viewController: UIViewController!
    
    init() {}
    
    func presentError(error: NetworkError) {
        let alert = UIAlertController(title: "Error", message: error.errorDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.viewController.navigationController?.present(alert, animated: false)
    }
}
