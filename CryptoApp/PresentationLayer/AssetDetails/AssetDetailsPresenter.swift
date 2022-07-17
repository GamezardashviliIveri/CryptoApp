//
//  AssetDetailsPresenter.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsPresenterProtocol {
    func viewDidLoad()
}

final class AssetDetailsPresenter: AssetDetailsPresenterProtocol {
    weak var viewController: AssetDetailsViewControllerProtocol?
    
    var formDelegate: FormDelegateProtocol?
    var formDataSource: FormDataSourceProtocol?
    
    private var builder: AssetDetailsViewModelsBuilderProtocol!
    private var assetDetailsViewModelsBuilderFactory: AssetDetailsViewModelsBuilderFactoryProtocol!
    private var viewModels = [CellViewModelProtocol]()
    private var coin: Coin
    
    init(
        coin: Coin,
        formDelegate: FormDelegateProtocol,
        formDataSource: FormDataSourceProtocol,
        assetDetailsViewModelsBuilderFactory: AssetDetailsViewModelsBuilderFactoryProtocol
    ) {
        self.coin = coin
        self.formDelegate = formDelegate
        self.formDataSource = formDataSource
        self.assetDetailsViewModelsBuilderFactory = assetDetailsViewModelsBuilderFactory
    }
    
    func viewDidLoad() {
        formDataSource?.notifyViewDidLoad()
        formDelegate?.notifyViewDidLoad()
        updateViewModels()
    }
}

// MARK: - Private Functions
extension AssetDetailsPresenter {
    private func updateViewModels() {
        builder = assetDetailsViewModelsBuilderFactory.make()
        viewModels = builder
            .addHeader(title: "\(coin.current_price)", subtitle: "\(coin.name) price", change: "\(coin.price_change_percentage_24h)")
            .addGraph(sparkline: coin.sparkline_in_7d.price.map { String($0) })
            .build()
        formDelegate?.update(viewModels: viewModels)
        formDataSource?.update(viewModels: viewModels, shouldScrollToTop: true)
    }
}
