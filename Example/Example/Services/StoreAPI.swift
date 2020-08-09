//
//  StoreAPI.swift
//  Example
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

import Foundation
import Networking

protocol StoreEnv {
    var baseUrl: String { get }
    var headers: [String: String] { get set }
}

class StoreAPI {
    let networking: NetworkProtocol
    
    init(env: StoreEnv) {
        networking = AFNetwork(baseUrl: env.baseUrl, headers: env.headers)
    }
    
    func search(
        query: StoreSearchQuery,
        result: @escaping ([Movie]?, Error?) -> Void
    ) {
        _ = networking.get(
            of: StoreResult<[StoreMovie]>.self,
            path: "/search",
            query: [
                "term": query.term,
                "country": query.country,
                "media": query.media
        ]) { (data, error) in
            result(data?.results.map { $0.toMovie() }, nil)
        }
    }
}
