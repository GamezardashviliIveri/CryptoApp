//
//  AssetDetailsViewModelsBuilderFactory.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsViewModelsBuilderFactoryProtocol {
    func make() -> AssetDetailsViewModelsBuilderProtocol
}

final class AssetDetailsViewModelsBuilderFactory: AssetDetailsViewModelsBuilderFactoryProtocol {
    private let formBuilderFactory: FormCellBuilderFactoryProtocol

    init(
        formBuilderFactory: FormCellBuilderFactoryProtocol
    ) {
        self.formBuilderFactory = formBuilderFactory
    }
    
    func make() -> AssetDetailsViewModelsBuilderProtocol {
        AssetDetailsViewModelsBuilder(formCellBuilder: formBuilderFactory.make())
    }
}
