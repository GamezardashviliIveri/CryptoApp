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
    @discardableResult func buildHeaderTableViewCellViewModel(
        title: String,
        subtitle: String,
        change: String
    ) -> Self
}

final class FormCellBuilder: FormCellBuilderProtocol {
    private var viewModels = [CellViewModelProtocol]()

    init() {}
    
    func build() -> [CellViewModelProtocol] {
        viewModels
    }
    
    func buildGraphTableViewCellViewModel(
        sparkline: [String]
    ) -> Self {
        let viewModel = GraphTableViewCellViewModel(
            sparkline: sparkline
        )
        viewModels.append(viewModel)
        return self
    }
    
    func buildMarketTableViewCellViewModel(
        coin: Coin,
        didTapAction: @escaping (Coin) -> Void
    ) -> Self {
        let viewModel = MarketTableViewCellViewModel(
            coin: coin,
            didTapAction: didTapAction
        )
        viewModels.append(viewModel)
        return self
    }
    
    func buildHeaderTableViewCellViewModel(
        title: String,
        subtitle: String,
        change: String
    ) -> Self {
        let viewModel = HeaderTableViewCellViewModel(
            title: title,
            subtitle: subtitle,
            change: change
        )
        viewModels.append(viewModel)
        return self
    }
}
