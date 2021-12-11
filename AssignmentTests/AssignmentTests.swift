//
//  AssignmentTests.swift
//  AssignmentTests
//
//  Created by Argo Hansen on 02.11.2020.
//  Copyright © 2020 Monese. All rights reserved.
//

import XCTest
@testable import Assignment

class AssignmentTests: XCTestCase {
    
    var apiClient: ApiMockResources!
    
    override func setUp() {
        super.setUp()
        apiClient = ApiMockResources()
    }
    
    
    // test from launches from api
    func test_fetch_launches_from_api() {
        let fetcher = HomeViewModel(apiResource: apiClient)
        
        XCTAssertEqual(fetcher.launches?.count, nil, "starting with no data...")
        let promise = XCTestExpectation(description: "loading data count...")
        
        fetcher.getAllLaunches(completion: { launch, error  in
            promise.fulfill()
            if let error = error {
                XCTFail()
                XCTAssertThrowsError(error)
            } else {
                if launch?.count == 147 {
                    promise.fulfill()
                }
            }
        })
        wait(for: [promise], timeout: 2)
    }
    
    //MARK:- Testing mock fetch cats
    
    func test_fetch_launches_from_json() {
        let expectation = XCTestExpectation(description: "Auth Response Parse Expectation")
        apiClient.fetchLaunchesfromJson(completion: { res in
            XCTAssertNil(nil)
            XCTAssertEqual(res.first?.name, "aaa")
            XCTAssertEqual(res.count, 3)
            XCTAssertEqual(res.last?.flightNumber, 3)
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 2)
    }
}
