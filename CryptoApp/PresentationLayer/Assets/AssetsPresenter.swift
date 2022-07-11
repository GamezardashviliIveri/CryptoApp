//
//  AssetsPresenter.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol AssetsPresenterProtocol {
    func interactorDidRetriveCoins(_ coins: [Coin])
    func interactorDidFailRetriveCoins(_ error: NetworkError)
}

final class AssetsPresenter: AssetsPresenterProtocol {
    weak var viewController: AssetsViewControllerProtocol?
    
    var formDelegate: FormDelegateProtocol?
    var formDataSource: FormDataSourceProtocol?
    
    private var builder: AssetsViewModelsBuilderProtocol!
    private var assetsViewModelsBuilderFactory: AssetsViewModelsBuilderFactoryProtocol!
    private var viewModels = [CellViewModelProtocol]()
    
    init(
        formDelegate: FormDelegateProtocol,
        formDataSource: FormDataSourceProtocol,
        assetsViewModelsBuilderFactory: AssetsViewModelsBuilderFactoryProtocol
    ) {
        self.formDelegate = formDelegate
        self.formDataSource = formDataSource
        self.assetsViewModelsBuilderFactory = assetsViewModelsBuilderFactory
    }
    
    func interactorDidRetriveCoins(_ coins: [Coin]) {
        formDataSource?.notifyViewDidLoad()
        formDelegate?.notifyViewDidLoad()
        updateViewModels(coins: coins)
    }
    func interactorDidFailRetriveCoins(_ error: NetworkError) {
        print(error)
    }
}

// MARK: - Private Functions
extension AssetsPresenter {
    private func updateViewModels(coins: [Coin]) {
//        print(coins)
        builder = assetsViewModelsBuilderFactory.make()
        viewModels = builder
            .addAssetFields(coins: coins)
            .build()
        formDelegate?.update(viewModels: viewModels)
        formDataSource?.update(viewModels: viewModels, viewShouldEndEditing: true)
    }
}
