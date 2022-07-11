//
//  HTTPClient.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

protocol NetworkService {
    func performRequest<ExpectedData: Decodable>(_ request: URLRequest, expectedData: ExpectedData.Type, completion: @escaping (Result<ExpectedData, NetworkError>) -> Void)
}

final class HTTPClient: NetworkService {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func performRequest<ExpectedData: Decodable>(_ request: URLRequest, expectedData: ExpectedData.Type, completion: @escaping (Result<ExpectedData, NetworkError>) -> Void) {
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                completion(.failure(.connectivity))
                return
            }
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                      completion(.failure(.invalidResponseCode))
                      return
                  }
            do {
                let decodedData = try JSONDecoder().decode(ExpectedData.self, from: data)
                completion(.success(decodedData))
            } catch {
                print(error)
                completion(.failure(.invalidData))
            }
        }.resume()
    }
}
