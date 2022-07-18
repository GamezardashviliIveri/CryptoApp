//
//  FormCellBuilderProtocol.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol FormCellBuilderProtocol {
    func build() -> [CellViewModelProtocol]
    @discardableResult func buildMarketTableViewCellViewModel(
        coin: Coin,
        didTapAction: @escaping (Coin) -> Void
    ) -> Self
    @discardableResult func buildGraphTableViewCellViewModel(
        sparkline: [String]
    ) -> Self
    @discardableResult func buildAssetsTableViewCellViewModel(
        coins: [Coin],
        didReachToTheEndCallBack: @escaping () -> Void
    ) -> Self
    @discardableResult func buildHeaderTableViewCellViewModel(
        title: String,
        subtitle: Float?,
        change: Float?,
        imageUrl: String
    ) -> Self
}

final class FormCellBuilder: FormCellBuilderProtocol {
    private var viewModels = [CellViewModelProtocol]()
    private var dynamicColorsProvider: DynamicColorsProviderProtocol!

    init(dynamicColorsProvider: DynamicColorsProviderProtocol) {
        self.dynamicColorsProvider = dynamicColorsProvider
    }
    
    func build() -> [CellViewModelProtocol] {
        viewModels
    }
    
    func buildGraphTableViewCellViewModel(
        sparkline: [String]
    ) -> Self {
        let viewModel = GraphTableViewCellViewModel(
            sparkline: sparkline,
            dynamicColorsProvider: dynamicColorsProvider
        )
        viewModels.append(viewModel)
        return self
    }
    
    func buildAssetsTableViewCellViewModel(
        coins: [Coin],
        didReachToTheEndCallBack: @escaping () -> Void
    ) -> Self {
        let viewModel = AssetsTableViewCellViewModel(coins: coins, dynamicColorsProvider: dynamicColorsProvider, didReachToTheEndCallBack: didReachToTheEndCallBack)
        viewModels.append(viewModel)
        return self
    }
    
    func buildMarketTableViewCellViewModel(
        coin: Coin,
        didTapAction: @escaping (Coin) -> Void
    ) -> Self {
        let viewModel = MarketTableViewCellViewModel(
            coin: coin,
            dynamicColorsProvider: dynamicColorsProvider,
            didTapAction: didTapAction
        )
        viewModels.append(viewModel)
        return self
    }
    
    func buildHeaderTableViewCellViewModel(
        title: String,
        subtitle: Float?,
        change: Float?,
        imageUrl: String
    ) -> Self {
        let viewModel = HeaderTableViewCellViewModel(
            title: title,
            subtitle: subtitle,
            change: change,
            imageUrl: imageUrl
        )
        viewModels.append(viewModel)
        return self
    }
}
