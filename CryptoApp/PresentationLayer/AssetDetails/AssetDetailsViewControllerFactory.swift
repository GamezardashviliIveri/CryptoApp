//
//  AssetDetailsViewControllerFactory.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import UIKit

protocol AssetDetailsViewControllerFactoryProtocol {
    func make(coin: Coin) -> UIViewController
}

final class AssetDetailsViewControllerFactory: AssetDetailsViewControllerFactoryProtocol {
    func make(coin: Coin) -> UIViewController {
        guard let assetDetailsViewController = UIStoryboard(name: "AssetDetailsViewController", bundle: nil).instantiateViewController(withIdentifier: "AssetDetailsViewController") as? AssetDetailsViewController else {
            return UIViewController()
        }
        let service = HTTPClient()
        let assetDetailsViewModelsBuilderFactory = AssetDetailsViewModelsBuilderFactory(formBuilderFactory: FormCellBuilderFactory())
        let formDelegate = FormDelegate()
        formDelegate.provider = assetDetailsViewController
        
        let formDataSource = FormDataSource()
        formDataSource.provider = assetDetailsViewController
        
        let assetDetailsInteractor = AssetDetailsInteractor(service: service)
        assetDetailsInteractor.presenter = AssetDetailsPresenter(
            coin: coin,
            formDelegate: formDelegate,
            formDataSource: formDataSource,
            assetDetailsViewModelsBuilderFactory: assetDetailsViewModelsBuilderFactory
        )
        assetDetailsViewController.interactor = assetDetailsInteractor
        return assetDetailsViewController
    }
}