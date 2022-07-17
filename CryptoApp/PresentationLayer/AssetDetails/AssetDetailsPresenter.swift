//
//  AssetDetailsPresenter.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsPresenterProtocol {
    func viewDidLoad(coins: [Coin])
}

final class AssetDetailsPresenter: AssetDetailsPresenterProtocol {
    private weak var viewController: AssetDetailsViewControllerProtocol!
    
    var formDelegate: FormDelegateProtocol!
    var formDataSource: FormDataSourceProtocol!
    
    private var builder: AssetDetailsViewModelsBuilderProtocol!
    private var assetDetailsViewModelsBuilderFactory: AssetDetailsViewModelsBuilderFactoryProtocol!
    private var viewModels = [CellViewModelProtocol]()
    private var coin: Coin
    
    init(
        viewController: AssetDetailsViewControllerProtocol,
        coin: Coin,
        formDelegate: FormDelegateProtocol,
        formDataSource: FormDataSourceProtocol,
        assetDetailsViewModelsBuilderFactory: AssetDetailsViewModelsBuilderFactoryProtocol
    ) {
        self.viewController = viewController
        self.coin = coin
        self.formDelegate = formDelegate
        self.formDataSource = formDataSource
        self.assetDetailsViewModelsBuilderFactory = assetDetailsViewModelsBuilderFactory
    }
    
    func viewDidLoad(coins: [Coin]) {
        formDataSource.notifyViewDidLoad()
        formDelegate.notifyViewDidLoad()
        updateViewModels(coins: coins)
    }
}

// MARK: - Private Functions
extension AssetDetailsPresenter {
    private func updateViewModels(coins: [Coin]) {
        builder = assetDetailsViewModelsBuilderFactory.make(actionsHandler: self)
        viewModels = builder
            .addHeader(
                title: coin.name,
                subtitle: coin.current_price,
                change: coin.price_change_percentage_24h,
                imageUrl: coin.image
            )
            .addGraph(sparkline: coin.sparkline_in_7d.price.map { String($0) })
            .addAssets(coins: coins)
            .build()
        formDelegate.update(viewModels: viewModels)
        formDataSource.update(viewModels: viewModels, shouldScrollToTop: true)
    }
}

extension AssetDetailsPresenter: AssetDetailsActionsHandler {
    func didReachToTheEnd() {
        viewController.didReachToTheEnd()
    }
}
