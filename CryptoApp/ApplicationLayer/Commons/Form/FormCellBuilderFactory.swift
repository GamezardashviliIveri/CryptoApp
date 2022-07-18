//
//  FormCellBuilderFactory.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol FormCellBuilderFactoryProtocol {
    func make() -> FormCellBuilderProtocol
}

final class FormCellBuilderFactory: FormCellBuilderFactoryProtocol {
    private let dynamicColorsProvider: DynamicColorsProviderProtocol
    
    init(dynamicColorsProvider: DynamicColorsProviderProtocol) {
        self.dynamicColorsProvider = dynamicColorsProvider
    }
    func make() -> FormCellBuilderProtocol {
        FormCellBuilder(dynamicColorsProvider: dynamicColorsProvider)
    }
}
