//
//  MockNetworkService.swift
//  CryptoAppTests
//
//  Created by iveri gamezardashvili on 7/18/22.
//

import Foundation

final class MockNetworkService: NetworkService {
    var compeletion: ((Result<[Decodable], NetworkError>) -> Void)?
    var didCallPerformRequest = false
    
    func performRequest<ExpectedData: Decodable>(_ request: URLRequest, expectedData: ExpectedData.Type, completion: @escaping (Result<ExpectedData, NetworkError>) -> Void) {
        didCallPerformRequest = true
    }
}
