//
//  AssetsViewModelsBuilderFactory.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol AssetsViewModelsBuilderFactoryProtocol {
    func make() -> AssetsViewModelsBuilderProtocol
}

final class AssetsViewModelsBuilderFactory: AssetsViewModelsBuilderFactoryProtocol {
    private let formBuilderFactory: FormCellBuilderFactoryProtocol

    init(
        formBuilderFactory: FormCellBuilderFactoryProtocol
    ) {
        self.formBuilderFactory = formBuilderFactory
    }
    
    func make() -> AssetsViewModelsBuilderProtocol {
        AssetsViewModelsBuilder(formCellBuilder: formBuilderFactory.make())
    }
}
