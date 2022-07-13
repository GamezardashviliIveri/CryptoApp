//
//  AssetDetailsViewModelsBuilder.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsViewModelsBuilderProtocol {
    func build() -> [CellViewModelProtocol]
    func addHeader(title: String, subtitle: String, change: String) -> AssetDetailsViewModelsBuilderProtocol
    func addGraph(sparkline: [String]) -> AssetDetailsViewModelsBuilderProtocol
}

final class AssetDetailsViewModelsBuilder: AssetDetailsViewModelsBuilderProtocol {
    private let formCellBuilder: FormCellBuilderProtocol

    init(
        formCellBuilder: FormCellBuilderProtocol
    ) {
        self.formCellBuilder = formCellBuilder
    }
    
    func build() -> [CellViewModelProtocol] {
        formCellBuilder.build()
    }
    
    func addHeader(title: String, subtitle: String, change: String) -> AssetDetailsViewModelsBuilderProtocol {
        formCellBuilder.buildHeaderTableViewCellViewModel(title: title, subtitle: subtitle, change: change)
        return self
    }
    
    func addGraph(sparkline: [String]) -> AssetDetailsViewModelsBuilderProtocol {
        formCellBuilder.buildGraphTableViewCellViewModel(sparkline: sparkline)
        return self
    }
}
