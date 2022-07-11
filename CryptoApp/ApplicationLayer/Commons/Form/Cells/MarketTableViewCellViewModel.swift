//
//  MarketTableViewCellViewModel.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

final class MarketTableViewCellViewModel: TappableCellViewModelProtocol {
    let didTapAction: (() -> Void)?
    let id: String
    let imageUrl: String
    let title: String
    let subtitle: String
    let marketCap: String
    let change: String

    init(
        imageUrl: String,
        title: String,
        subtitle: String,
        marketCap: String,
        change: String,
        didTapAction: (() -> Void)?
    ) {
        self.id = title
        self.imageUrl = imageUrl
        self.title = title
        self.subtitle = subtitle
        self.marketCap = marketCap
        self.change = change
        self.didTapAction = didTapAction
    }
}

extension MarketTableViewCellViewModel: CellViewModelProtocol {
    public func cell(
        for tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MarketTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! MarketTableViewCell
        
        cell.iconImageView.imageFromServerURL(imageUrl, placeHolder: nil)
        cell.iconNameLabel.text = title
        cell.iconSymbolLabel.text = subtitle
        cell.marketCapLabel.text = marketCap
        cell.changeLabel.text = change
        
        return cell
    }
    
    public func isEqual(other: Differentiable) -> Bool {
        guard let other = other as? Self else { return false }
        return id == other.id
    }
}
