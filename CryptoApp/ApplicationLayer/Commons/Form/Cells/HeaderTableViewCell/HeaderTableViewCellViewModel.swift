//
//  HeaderTableViewCellViewModel.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import UIKit

final class HeaderTableViewCellViewModel {
    let id: String
    let imageUrl: String
    let title: String
    let subtitle: Float?
    let change: Float?

    init(
        title: String,
        subtitle: Float?,
        change: Float?,
        imageUrl: String
    ) {
        self.id = title
        self.title = title
        self.subtitle = subtitle
        self.change = change
        self.imageUrl = imageUrl
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
        
        cell.coinImageView.imageFromServerURL(imageUrl, placeHolder: nil)
        cell.titleLabel.text = title
        cell.subtitleLabel.text = subtitle == nil ? "" : "$\(subtitle!)"
        cell.changeLabel.text = change == nil ? "" : "\(change!)%"
        
        return cell
    }
    
    public func isEqual(other: Differentiable) -> Bool {
        guard let other = other as? Self else { return false }
        return id == other.id
    }
}
