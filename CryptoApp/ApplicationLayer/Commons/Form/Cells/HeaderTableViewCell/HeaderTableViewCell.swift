//
//  HeaderTableViewCell.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var imageHolderView: UIView!
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var changeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageHolderView.layer.cornerRadius = 8
        imageHolderView.clipsToBounds = true
    }
}
