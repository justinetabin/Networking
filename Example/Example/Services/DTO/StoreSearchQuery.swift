//
//  StoreSearchQuery.swift
//  Example
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

import Networking

struct StoreSearchQuery: NetworkQueryable {
    let term: String
    let country: String
    let media: String
    
    var dict: [String : String] {
        [
            "term": term,
            "country": country,
            "media": media
        ]
    }
}
