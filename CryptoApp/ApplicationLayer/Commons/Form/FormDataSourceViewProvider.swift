//
//  FormDataSourceViewProvider.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import UIKit

protocol FormDataSourceViewProvider: AnyObject {
    var tableView: UITableView { get }
    func didReachToTheBottom()
}

extension FormDataSourceViewProvider {
    func didReachToTheBottom() {}
}
