//
//  AssetDetailsViewModelsBuilder.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsViewModelsBuilderProtocol {
    func build() -> [CellViewModelProtocol]
    func addHeader(title: String, subtitle: Float?, change: Float?, imageUrl: String) -> AssetDetailsViewModelsBuilderProtocol
    func addGraph(sparkline: [String]) -> AssetDetailsViewModelsBuilderProtocol
    func addAssets(coins: [Coin]) -> AssetDetailsViewModelsBuilderProtocol
}

protocol AssetDetailsActionsHandler: AnyObject {
    func didReachToTheEnd()
}

final class AssetDetailsViewModelsBuilder: AssetDetailsViewModelsBuilderProtocol {
    weak var actionsHandler: AssetDetailsActionsHandler?
    private let formCellBuilder: FormCellBuilderProtocol

    init(
        formCellBuilder: FormCellBuilderProtocol
    ) {
        self.formCellBuilder = formCellBuilder
    }
    
    func build() -> [CellViewModelProtocol] {
        formCellBuilder.build()
    }
    
    func addHeader(title: String, subtitle: Float?, change: Float?, imageUrl: String) -> AssetDetailsViewModelsBuilderProtocol {
        formCellBuilder.buildHeaderTableViewCellViewModel(title: title, subtitle: subtitle, change: change, imageUrl: imageUrl)
        return self
    }
    
    func addGraph(sparkline: [String]) -> AssetDetailsViewModelsBuilderProtocol {
        formCellBuilder.buildGraphTableViewCellViewModel(sparkline: sparkline)
        return self
    }
    
    func addAssets(coins: [Coin]) -> AssetDetailsViewModelsBuilderProtocol {
        formCellBuilder.buildAssetsTableViewCellViewModel(coins: coins) { [weak self] in
            self?.actionsHandler?.didReachToTheEnd()
        }
        return self
    }
}
