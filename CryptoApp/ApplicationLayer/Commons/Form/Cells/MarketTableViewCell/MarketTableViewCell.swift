//
//  MarketTableViewCell.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

class MarketTableViewCell: UITableViewCell {
    var didTapActionCallBack: (() -> Void)?
    @IBOutlet weak var contentHolderView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconNameLabel: UILabel!
    @IBOutlet weak var iconSymbolLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentHolderView.layer.cornerRadius = 8
    }
    
    @IBAction func didTapAction(_ sender: Any) {
        didTapActionCallBack?()
    }
}
