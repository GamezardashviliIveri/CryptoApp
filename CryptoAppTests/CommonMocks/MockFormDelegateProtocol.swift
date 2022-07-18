//
//  MockFormDelegateProtocol.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import UIKit

final class MockFormDelegateProtocol: FormDelegateProtocol {
    var didCallNotifyViewDidLoad = false
    var didCallUpdate = false
    
    func notifyViewDidLoad() {
        didCallNotifyViewDidLoad = true
    }
    
    func update(viewModels: [CellViewModelProtocol]) {
        didCallUpdate = true
    }
}

final class MockFormDataSourceProtocol: FormDataSourceProtocol {
    var didCallNotifyViewDidLoad = false
    var didCallUpdate = false
    
    func notifyViewDidLoad() {
        didCallNotifyViewDidLoad = true
    }
    
    func update(viewModels: [CellViewModelProtocol], shouldScrollToTop: Bool) {
        didCallUpdate = true
    }
    
    func cell<T>(for viewModel: CellViewModelProtocol) -> T? {
        UITableViewCell() as? T
    }
}
