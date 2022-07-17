//
//  AssetsTableViewCell.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/13/22.
//

import UIKit

protocol AssetsTableViewCellDelegate: AnyObject {
    func didReachToTheEnd()
}

class AssetsTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    weak var delegate: AssetsTableViewCellDelegate?
    var coins = [Coin]()
    
    override func awakeFromNib() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate

extension AssetsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        coins.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AssetCollectionViewCell", for: indexPath as IndexPath) as! AssetCollectionViewCell
        let coin = coins[indexPath.row]
        cell.coinImageView.imageFromServerURL(coin.image, placeHolder: nil)
        cell.nameLabel.text = coin.name
        cell.symbolLabel.text = coin.symbol
        cell.priceLabel.text = coin.current_price == nil ? nil : "$\(coin.current_price!)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard indexPath.row == coins.count - 1 else { return }
        delegate?.didReachToTheEnd()
    }
}
