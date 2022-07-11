//
//  UITableView+Helper.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

private func identifier(for object: AnyClass) -> String {
    let nameSpaceClassName = NSStringFromClass(object)
    guard let className = nameSpaceClassName.components(separatedBy: ".").last else {
        return nameSpaceClassName
    }
    return className
}

extension UICollectionViewCell {
    static var reuseIdentifier: String {
        identifier(for: self)
    }
}

extension UITableViewCell {
    static var reuseIdentifier: String {
        identifier(for: self)
    }
}
