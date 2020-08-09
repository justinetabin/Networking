//
//  Env.swift
//  Example
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

import Foundation

struct StoreProd: StoreEnv {
    var baseUrl: String { "https://itunes.apple.com" }
    var headers: [String : String] = [:]
}
