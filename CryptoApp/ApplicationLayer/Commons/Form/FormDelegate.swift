//
//  FormDelegate.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

final class FormDelegate: NSObject, FormDelegateProtocol {
    weak var provider: FormDataSourceViewProvider?

    private var viewModels = [CellViewModelProtocol]()

    func notifyViewDidLoad() {
        provider?.tableView.delegate = self
    }

    func update(viewModels: [CellViewModelProtocol]) {
        self.viewModels = viewModels
    }
}

// MARK: - UITableViewDelegate

extension FormDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let viewModel = viewModels[indexPath.row] as? TappableCellViewModelProtocol else { return }
        viewModel.didTapAction?()
    }
    
    func tableView(_: UITableView, willDisplay _: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == viewModels.count - 1 else { return }
        provider?.didReachToTheBottom()
    }
}
