//
//  CellViewModelProtocol.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

protocol Differentiable {
    var id: String { get }
    func isEqual(other: Differentiable) -> Bool
}

protocol CellViewModelProtocol: Differentiable {
    var isFirstResponder: Bool { get }
    @discardableResult func becomeFirstResponder() -> Bool
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

extension CellViewModelProtocol {
    @discardableResult public func becomeFirstResponder() -> Bool { false }
    public var isFirstResponder: Bool { false }
}
