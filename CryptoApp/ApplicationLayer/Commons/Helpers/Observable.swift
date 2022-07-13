//
//  Observable.swift
//  CryptoApp
//
//  Created by iveri gamezardashvili on 7/13/22.
//

import Foundation

final class Observable<T> {
    public var value: T {
        didSet { listener?(value) }
    }

    private var listener: ((T) -> Void)?

    public init(_ value: T) {
        self.value = value
    }

    public func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
