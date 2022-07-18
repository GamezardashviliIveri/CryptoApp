//
//  NetworkError.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/11/22.
//

import Foundation

enum NetworkError: Error {
    case connectivity
    case invalidResponseCode
    case invalidData
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .connectivity:
            return "connection error"
        case .invalidResponseCode, .invalidData:
            return "something went wrong"
        }
    }
}
