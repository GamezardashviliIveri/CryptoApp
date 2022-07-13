//
//  AssetDetailsInteractor.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/12/22.
//

import Foundation

protocol AssetDetailsInteractorProtocol {
    func viewDidLoad() -> Void
}

final class AssetDetailsInteractor: AssetDetailsInteractorProtocol {
    var presenter: AssetDetailsPresenterProtocol?
    private let service: NetworkService

    init(service: NetworkService) {
        self.service = service
    }
    
    func viewDidLoad() -> Void {
        presenter?.viewDidLoad()
    }
}
