//
//  FormDelegateProtocol.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol FormDelegateProtocol {
    func notifyViewDidLoad()
    func update(viewModels: [CellViewModelProtocol])
}
