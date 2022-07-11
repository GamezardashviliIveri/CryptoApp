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
    func make() -> FormCellBuilderProtocol {
        FormCellBuilder()
    }
}
