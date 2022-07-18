//
//  AssetsTableViewCellViewModel.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/13/22.
//

import UIKit

final class AssetsTableViewCellViewModel {
    let id: String = "AssetsTableViewCellViewModel"
    let coins: [Coin]
    let dynamicColorsProvider: DynamicColorsProviderProtocol
    let didReachToTheEndCallBack: () -> Void

    init(
        coins: [Coin],
        dynamicColorsProvider: DynamicColorsProviderProtocol,
        didReachToTheEndCallBack: @escaping () -> Void
    ) {
        self.coins = coins
        self.dynamicColorsProvider = dynamicColorsProvider
        self.didReachToTheEndCallBack = didReachToTheEndCallBack
    }
}

// MARK: - CellViewModelProtocol

extension AssetsTableViewCellViewModel: CellViewModelProtocol {
    public func cell(
        for tableView: UITableView,
        indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: AssetsTableViewCell.reuseIdentifier,
            for: indexPath
        ) as! AssetsTableViewCell
        
        cell.collectionView.register(UINib(nibName: "AssetCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AssetCollectionViewCell")
        cell.assetsLabel.textColor = dynamicColorsProvider.labelColor.uiColor
        cell.coins = coins
        cell.dynamicColorsProvider = dynamicColorsProvider
        cell.collectionView.reloadData()
        cell.delegate = self

        return cell
    }
    
    public func isEqual(other: Differentiable) -> Bool {
        guard let other = other as? Self else { return false }
        return id == other.id
    }
}

// MARK: - AssetsTableViewCellDelegate

extension AssetsTableViewCellViewModel: AssetsTableViewCellDelegate {
    func didReachToTheEnd() {
        didReachToTheEndCallBack()
    }
}
