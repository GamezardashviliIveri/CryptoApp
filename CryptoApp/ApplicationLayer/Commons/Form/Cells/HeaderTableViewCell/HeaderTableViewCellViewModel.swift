//
//  HeaderTableViewCellViewModel.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import UIKit

final class HeaderTableViewCellViewModel {
    let id: String
    let title: String
    let subtitle: String
    let change: String

    init(
        title: String,
        subtitle: String,
        change: String
    ) {
        self.id = title
        self.title = title
        self.subtitle = subtitle
        self.change = change
    }
}

extension HeaderTableViewCellViewModel: CellViewModelProtocol {
    public func cell(
        for tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HeaderTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! HeaderTableViewCell
        
        cell.titleLabel.text = title
        cell.subtitleLabel.text = subtitle
        cell.changeLabel.text = change
        
        return cell
    }
    
    public func isEqual(other: Differentiable) -> Bool {
        guard let other = other as? Self else { return false }
        return id == other.id
    }
}
