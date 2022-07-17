//
//  FormDataSource.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

final class FormDataSource: NSObject, UITableViewDataSource {
    weak var provider: FormDataSourceViewProvider?
    private var viewModels = [CellViewModelProtocol]()
}

// MARK: - FormDataSourceProtocol

extension FormDataSource: FormDataSourceProtocol {
    func notifyViewDidLoad() {
        cellsClasses.forEach { cellClass in
            let identifier = cellClass.reuseIdentifier
            let nib = UINib(
                nibName: identifier,
                bundle: nil
            )
            provider?.tableView.register(
                nib,
                forCellReuseIdentifier: identifier
            )
        }
        provider?.tableView.dataSource = self
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = viewModels[indexPath.row]
        return viewModel.cell(for: tableView, indexPath: indexPath)
    }

    func update(
        viewModels: [CellViewModelProtocol],
        shouldScrollToTop: Bool
    ) {
        let responderCell = self.viewModels.first { $0.isFirstResponder }

        self.viewModels = viewModels
        self.reload(responderCell: responderCell, shouldScrollToTop: shouldScrollToTop)
    }

    private func reload(responderCell: CellViewModelProtocol?, shouldScrollToTop: Bool) {
        provider?.tableView.reloadData()
        if shouldScrollToTop {
            provider?.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }
        guard
            let responderCell = responderCell,
            let newResponderCell = viewModels.first(where: { $0.id == responderCell.id })
        else { return }
        newResponderCell.becomeFirstResponder()
    }
}

// MARK: - CellViewModelDelegateProtocol

extension FormDataSource: CellViewModelDelegateProtocol {
    func cell<T>(for viewModel: CellViewModelProtocol) -> T? {
        let row = viewModels.firstIndex { $0.id == viewModel.id }
        let indexPath = row.flatMap { IndexPath(row: $0, section: 0) }
        let cell = indexPath.flatMap { provider?.tableView.cellForRow(at: $0) as? T }
        return cell
    }
}

// MARK: - Private Methods

extension FormDataSource {
    private func index(of change: CollectionDifference<CellViewModelProtocol>.Change) -> IndexPath {
        switch change {
        case .remove(offset: let offset, element: _, associatedWith: _):
            return IndexPath(row: offset, section: 0)
        case .insert(offset: let offset, element: _, associatedWith: _):
            return IndexPath(row: offset, section: 0)
        }
    }

    private var cellsClasses: [UITableViewCell.Type] {
        [
            MarketTableViewCell.self,
            HeaderTableViewCell.self,
            GraphTableViewCell.self,
            AssetsTableViewCell.self
        ]
    }
}
