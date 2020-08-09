//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by Justine Tabin on 8/9/20.
//  Copyright © 2020 Justine Tabin. All rights reserved.
//

import XCTest
@testable import Example

class ExampleTests: XCTestCase {
    
    var sut: StoreAPI!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = StoreAPI(env: StoreProd())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test() {
        // given
        let expect = expectation(description: "")
        let query = StoreSearchQuery(term: "star", country: "au", media: "movie")
        
        // when
        var gotMovies: [Movie]?
        var gotError: Error?
        sut.search(query: query) { (movies, error) in
            gotMovies = movies
            gotError = error
            expect.fulfill()
        }
        
        // then
        waitForExpectations(timeout: 30.0, handler: nil)
        XCTAssertNotNil(gotMovies)
        XCTAssertNil(gotError)
    }

}
