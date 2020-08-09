//
//  StoreMovie.swift
//  Example
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

struct StoreMovie: Decodable {
    let trackId: Int
    
    func toMovie() -> Movie {
        Movie(trackId: trackId)
    }
}
