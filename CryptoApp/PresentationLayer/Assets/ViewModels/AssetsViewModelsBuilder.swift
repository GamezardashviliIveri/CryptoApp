//
//  AssetsViewModelsBuilder.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol AssetsViewModelsBuilderProtocol {
    func build() -> [CellViewModelProtocol]
    func addAssetFields(coins: [Coin]) -> AssetsViewModelsBuilderProtocol
}

protocol AssetsActionsHandler: AnyObject {
    func didTap(coin: Coin)
}


final class AssetsViewModelsBuilder: AssetsViewModelsBuilderProtocol {
    weak var actionsHandler: AssetsActionsHandler?

    private let formCellBuilder: FormCellBuilderProtocol

    init(
        formCellBuilder: FormCellBuilderProtocol
    ) {
        self.formCellBuilder = formCellBuilder
    }
    
    func build() -> [CellViewModelProtocol] {
        formCellBuilder.build()
    }
    
    func addAssetFields(coins: [Coin]) -> AssetsViewModelsBuilderProtocol {
        coins.forEach {
            formCellBuilder.buildMarketTableViewCellViewModel(
                coin: $0
            ) { [weak actionsHandler] coin in
                actionsHandler?.didTap(coin: coin)
            }
        }
        return self
    }
}
