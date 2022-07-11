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
        imageUrl: String,
        title: String,
        subtitle: String,
        marketCap: String,
        change: String,
        didTapAction: (() -> Void)?
    ) -> Self
}

final class FormCellBuilder: FormCellBuilderProtocol {
    private var viewModels = [CellViewModelProtocol]()

    init() {
        
    }
    
    func build() -> [CellViewModelProtocol] {
        viewModels
    }
    
    func buildMarketTableViewCellViewModel(
        imageUrl: String,
        title: String,
        subtitle: String,
        marketCap: String,
        change: String,
        didTapAction: (() -> Void)?
    ) -> Self {
        let viewModel = MarketTableViewCellViewModel(
            imageUrl: imageUrl,
            title: title,
            subtitle: subtitle,
            marketCap: marketCap,
            change: change,
            didTapAction: didTapAction
        )
        viewModels.append(viewModel)
        return self
    }
}
