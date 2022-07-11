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

final class AssetsViewModelsBuilder: AssetsViewModelsBuilderProtocol {
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
                imageUrl: $0.image,
                title: $0.name,
                subtitle: $0.symbol,
                marketCap: "\($0.current_price)",
                change: "\($0.price_change_percentage_24h)"
            ) {
                print("should move")
            }
        }
        return self
    }
}
