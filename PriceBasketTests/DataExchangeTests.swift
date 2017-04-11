//
//  DataExchangeTests.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 26/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import XCTest
@testable import PriceBasket

class DataExchangeTests: XCTestCase {
    
    var dataController: ExchangeDataController?
    var jsondict: [String: Any]?
    
    private func readJson(file: String) {
        do {
            
            let bundle = Bundle(for: type(of: self))
            
            if let file = bundle.url(forResource: file, withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    //print(object)
                    jsondict = object
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func setUp() {
        super.setUp()

        readJson(file: "Exchange")
        
        DataCurrencyTests().setUp()
        dataController = ExchangeDataController()
        dataController?.deleteAll()
        if let jsondict = jsondict {
            dataController?.addfromJSON(data: jsondict, completionHandler: { (success) in
            })
        }

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        DataCurrencyTests().tearDown()
    }
    
    func testaddfromJSON() {
        if let data = dataController?.readAll() {
            if !data.isEmpty || data.count > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
    func testreadExchangeFor() {
        if let data = dataController?.readExchangeFor(currency: "USD") {
            if data == 1.0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
    func testdeleteAll() {
        dataController?.deleteAll()
        if let data = dataController?.readAll() {
            if data.isEmpty || data.count == 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTAssert(true, "Pass")
        }
    }
    
    func testreadAll() {
        if let data = dataController?.readAll() {
            if !data.isEmpty || data.count > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
}
