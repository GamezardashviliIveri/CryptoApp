//
//  TappableCellViewModelProtocol.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol TappableCellViewModelProtocol {
    var didTapAction: (() -> Void)? { get }
}
