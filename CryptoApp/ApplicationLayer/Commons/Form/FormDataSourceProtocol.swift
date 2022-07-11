//
//  FormDataSourceProtocol.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol CellViewModelDelegateProtocol: AnyObject {
    func cell<T>(for viewModel: CellViewModelProtocol) -> T?
}

protocol FormDataSourceProtocol: CellViewModelDelegateProtocol {
   func notifyViewDidLoad()
   func update(
       viewModels: [CellViewModelProtocol],
       viewShouldEndEditing: Bool
   )
}
