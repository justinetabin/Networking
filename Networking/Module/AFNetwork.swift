//
//  AFNetwork.swift
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

import Alamofire

open class AFNetwork: NetworkProtocol {
    public var baseUrl: String
    public var headers: [String: String]

    public init(baseUrl: String, headers: [String: String]) {
        self.baseUrl = baseUrl
        self.headers = headers
    }

    public func cancelAllRequests() {
        AF.cancelAllRequests()
    }

    public func get<T>(
        of: T.Type,
        path: String,
        query: NetworkQueryable,
        result: @escaping (T?, Error?) -> Void
    ) -> NetworkCancellable? where T : Decodable {
        AFCancellable(
            dataRequest: AF.request(
                baseUrl + path,
                method: .get,
                parameters: query.dict,
                headers: HTTPHeaders(headers)
            )
                .responseDecodable(of: of) { (response) in
                    switch response.result {
                    case .success(let data):
                        result(data, nil)
                    case .failure(let error):
                        result(nil, error)
                    }
            }
        )
    }
}

public struct AFCancellable: NetworkCancellable {

    var dataRequest: DataRequest
    
    public func cancel() {
        dataRequest.cancel()
    }
}
