//
//  MatchTest.swift
//  opendota
//
//  Created by Linh Hoang on 1/25/17.
//  Copyright © 2017 Linh Hoang. All rights reserved.
//

import XCTest
@testable import opendota

class MatchTest: XCTestCase {

    var match: Match =  Match()
    var players :[InMatchPlayer] = []
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        match.getMatchInfo(){
            self.players = self.match.players!
            for t in self.players{
                print(t.assists ?? "fuck")
            }
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
