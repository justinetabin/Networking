//
//  AFNetwork.swift
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

import Alamofire

open class AFNetwork: NetworkProtocol {
    private var AF: SessionManager
    public var baseUrl: String
    public var headers: [String: String]

    public init(baseUrl: String, headers: [String: String]) {
        self.baseUrl = baseUrl
        self.headers = headers
        AF = Alamofire.SessionManager.default
    }

    public func cancelAllRequests() {
        AF.session.getAllTasks { (tasks) in
            tasks.forEach { $0.cancel() }
        }
    }

    public func get<T>(
        of: T.Type,
        path: String,
        query: NetworkQueryable? = nil,
        result: @escaping (T?, Error?) -> Void
    ) -> NetworkCancellable? where T: Decodable {
        AF
          .request(
            baseUrl + path,
            method: .get,
            parameters: query?.dict,
            headers: headers
          )
          .responseData { (response) in
            switch response.result {
            case .success(let data):
              do {
                let dto = try JSONDecoder().decode(of, from: data)
                result(dto, nil)
              } catch let error {
                result(nil, error)
              }
            case .failure(let error):
              result(nil, error)
            }
        }
    }
}

extension DataRequest: NetworkCancellable { }
