//
//  MarketTableViewCellViewModel.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

final class MarketTableViewCellViewModel {
    let didTapAction: ((Coin) -> Void)
    let coin: Coin
    let dynamicColorsProvider: DynamicColorsProviderProtocol
    let id: String
    let imageUrl: String
    let title: String
    let subtitle: String
    let marketCap: String
    let change: String

    init(
        coin: Coin,
        dynamicColorsProvider: DynamicColorsProviderProtocol,
        didTapAction: @escaping (Coin) -> Void
    ) {
        self.coin = coin
        self.dynamicColorsProvider = dynamicColorsProvider
        self.id = coin.name
        self.imageUrl = coin.image
        self.title = coin.name
        self.subtitle = coin.symbol
        self.marketCap = coin.current_price == nil ? "" : "\(coin.current_price!)"
        self.change = coin.price_change_percentage_24h == nil ? "" : "\(coin.price_change_percentage_24h!)"
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
        
        cell.contentHolderView.backgroundColor = dynamicColorsProvider.cardBackground.uiColor
        cell.iconImageView.imageFromServerURL(imageUrl, placeHolder: nil)
        cell.iconNameLabel.text = title
        cell.iconSymbolLabel.text = subtitle
        cell.marketCapLabel.text = "$\(marketCap)"
        cell.changeLabel.text = "\(change)%"
        cell.didTapActionCallBack = { self.didTapAction(self.coin) }
        
        return cell
    }
    
    public func isEqual(other: Differentiable) -> Bool {
        guard let other = other as? Self else { return false }
        return id == other.id
    }
}
