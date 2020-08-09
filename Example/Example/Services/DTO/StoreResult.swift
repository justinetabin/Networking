//
//  StoreResult.swift
//  Example
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

struct StoreResult<T: Decodable>: Decodable {
    let resultCount: Int
    let results: T
}
