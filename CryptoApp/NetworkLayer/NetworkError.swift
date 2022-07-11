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
