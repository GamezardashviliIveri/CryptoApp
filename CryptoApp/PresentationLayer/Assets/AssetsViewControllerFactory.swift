//
//  AssetsViewControllerFactory.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

protocol AssetsViewControllerFactoryProtocol {
    func make() -> UIViewController
}

final class AssetsViewControllerFactory: AssetsViewControllerFactoryProtocol {
    func make() -> UIViewController {
        guard let assetsViewController = UIStoryboard(name: "AssetsViewController", bundle: nil).instantiateViewController(withIdentifier: "AssetsViewController") as? AssetsViewController else {
            return UIViewController()
        }
        let service = HTTPClient()
        let dynamicColorsProvider = DynamicColorsProvider()

        let assetsViewModelsBuilderFactory = AssetsViewModelsBuilderFactory(formBuilderFactory: FormCellBuilderFactory(dynamicColorsProvider: dynamicColorsProvider))
        let formDelegate = FormDelegate()
        formDelegate.provider = assetsViewController
        
        let formDataSource = FormDataSource()
        formDataSource.provider = assetsViewController
        
        let assetsRouter = AssetsRouter(assetDetailsViewControllerFactory: AssetDetailsViewControllerFactory())
        assetsRouter.viewController = assetsViewController
        
        let assetsInteractor = AssetsInteractor(service: service)
        assetsInteractor.presenter = AssetsPresenter(
            formDelegate: formDelegate,
            formDataSource: formDataSource,
            router: assetsRouter,
            assetsViewModelsBuilderFactory: assetsViewModelsBuilderFactory
        )
        
        assetsViewController.interactor = assetsInteractor
        assetsViewController.router = assetsRouter
        assetsViewController.dynamicColorsProvider = dynamicColorsProvider
        
        return assetsViewController
    }
}
