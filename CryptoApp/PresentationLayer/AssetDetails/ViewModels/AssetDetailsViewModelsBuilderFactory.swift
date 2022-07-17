//
//  AssetDetailsViewModelsBuilderFactory.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsViewModelsBuilderFactoryProtocol {
    func make(actionsHandler: AssetDetailsActionsHandler) -> AssetDetailsViewModelsBuilderProtocol
}

final class AssetDetailsViewModelsBuilderFactory: AssetDetailsViewModelsBuilderFactoryProtocol {
    private let formBuilderFactory: FormCellBuilderFactoryProtocol

    init(
        formBuilderFactory: FormCellBuilderFactoryProtocol
    ) {
        self.formBuilderFactory = formBuilderFactory
    }
    
    func make(actionsHandler: AssetDetailsActionsHandler) -> AssetDetailsViewModelsBuilderProtocol {
        let viewModelsBuidler = AssetDetailsViewModelsBuilder(formCellBuilder: formBuilderFactory.make())
        viewModelsBuidler.actionsHandler = actionsHandler
        return viewModelsBuidler
    }
}
