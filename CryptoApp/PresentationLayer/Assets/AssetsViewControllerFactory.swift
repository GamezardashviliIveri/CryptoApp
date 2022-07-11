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
        let assetsViewModelsBuilderFactory = AssetsViewModelsBuilderFactory(formBuilderFactory: FormCellBuilderFactory())
        let formDelegate = FormDelegate()
        formDelegate.provider = assetsViewController
        
        let formDataSource = FormDataSource()
        formDataSource.provider = assetsViewController
        
        let assetsInteractor = AssetsInteractor(service: service)
        assetsInteractor.presenter = AssetsPresenter(
            formDelegate: formDelegate,
            formDataSource: formDataSource,
            assetsViewModelsBuilderFactory: assetsViewModelsBuilderFactory
        )
        
        let assetsRouter = AssetsRouter()
        
        assetsViewController.setUp(
            interactor: assetsInteractor,
            router: assetsRouter
        )
        return assetsViewController
    }
}
