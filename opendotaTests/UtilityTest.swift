//
//  UtilityTest.swift
//  opendota
//
//  Created by Linh Hoang on 3/8/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import XCTest
@testable import opendota

class UtilityTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCTAssertEqual(Int.toNetWorth(number: 10600), "10.6k")

    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
