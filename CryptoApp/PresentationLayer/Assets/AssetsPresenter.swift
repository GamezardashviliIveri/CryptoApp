//
//  AssetsPresenter.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol AssetsPresenterProtocol {
    func interactorDidRetriveCoins(_ coins: [Coin], shouldScrollToTop: Bool)
    func interactorDidFailRetriveCoins(_ error: NetworkError)
}

final class AssetsPresenter: AssetsPresenterProtocol {
    weak var viewController: AssetsViewControllerProtocol?
    
    var formDelegate: FormDelegateProtocol?
    var formDataSource: FormDataSourceProtocol?
    var router: AssetsRouterProtocol?
    
    private var builder: AssetsViewModelsBuilderProtocol!
    private var assetsViewModelsBuilderFactory: AssetsViewModelsBuilderFactoryProtocol!
    private var viewModels = [CellViewModelProtocol]()
    
    init(
        formDelegate: FormDelegateProtocol,
        formDataSource: FormDataSourceProtocol,
        router: AssetsRouterProtocol,
        assetsViewModelsBuilderFactory: AssetsViewModelsBuilderFactoryProtocol
    ) {
        self.formDelegate = formDelegate
        self.formDataSource = formDataSource
        self.router = router
        self.assetsViewModelsBuilderFactory = assetsViewModelsBuilderFactory
    }
    
    func interactorDidRetriveCoins(_ coins: [Coin], shouldScrollToTop: Bool) {
        formDataSource?.notifyViewDidLoad()
        formDelegate?.notifyViewDidLoad()
        updateViewModels(coins: coins, shouldScrollToTop: shouldScrollToTop)
    }
    
    func interactorDidFailRetriveCoins(_ error: NetworkError) {
        router?.presentError(error: error)
    }
}

extension AssetsPresenter: AssetsActionsHandler {
    func didTap(coin: Coin) {
        router?.showAssetDetailsScreen(for: coin)
    }
}

// MARK: - Private Functions
extension AssetsPresenter {
    private func updateViewModels(coins: [Coin], shouldScrollToTop: Bool) {
        builder = assetsViewModelsBuilderFactory.make(actionsHandler: self)
        viewModels = builder
            .addAssetFields(coins: coins)
            .build()
        formDelegate?.update(viewModels: viewModels)
        formDataSource?.update(viewModels: viewModels, shouldScrollToTop: shouldScrollToTop)
    }
}
