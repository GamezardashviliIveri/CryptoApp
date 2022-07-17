//
//  AssetCollectionViewCell.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/17/22.
//

import UIKit

class AssetCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentHolderView: UIView!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        contentHolderView.layer.cornerRadius = 16
    }
}
