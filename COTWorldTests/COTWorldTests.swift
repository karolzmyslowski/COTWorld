//
//  COTWorldTests.swift
//  COTWorldTests
//
//  Created by Karol Zmyslowski on 12.05.2018.
//  Copyright © 2018 Karol Zmyslowski. All rights reserved.
//

import XCTest
@testable import COTWorld

class COTWorldTests: XCTestCase {
    
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
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testInfoLoading() {
        
        let url = "https://restcountries.eu/rest/v2/all"
        CountryService.shared.downloadCountry(urlString: url, tableView: nil) { (country) in
            let result = country?.isEmpty
            XCTAssert(result != true, "No data was received from the server for View ")
        }
        
    }
}
