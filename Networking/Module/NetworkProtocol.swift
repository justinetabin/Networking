//
//  NetworkProtocol.swift
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

import Foundation

public protocol NetworkQueryable {
    var dict: [String: String] { get }
}

public protocol NetworkCancellable {
    func cancel()
}

public protocol NetworkProtocol {
    var baseUrl: String { get }
    var headers: [String: String] { get }
    
    func cancelAllRequests()
    
    func get<T: Decodable>(
        of: T.Type,
        path: String,
        query: NetworkQueryable,
        result: @escaping (T?, Error?) -> Void
    ) -> NetworkCancellable?
}
