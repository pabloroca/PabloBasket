//
//  DataCurrencyTests.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 26/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import XCTest
@testable import PriceBasket

class DataCurrencyTests: XCTestCase {
    
    var dataController: CurrencyDataController?
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
                    self.jsondict = object
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
        
        readJson(file: "Currency")
        
        self.dataController = CurrencyDataController()
        self.dataController?.deleteAll()
        if let jsondict = self.jsondict {
            self.dataController?.addfromJSON(data: jsondict, completionHandler: { (success) in
            })
        }
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.dataController?.deleteAll()
    }
    
    func testaddfromJSON() {
        if let data = self.dataController?.readAll() {
            if !data.isEmpty || data.count > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
    func testdeleteAll() {
        self.dataController?.deleteAll()
        if let data = self.dataController?.readAll() {
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
        if let data = self.dataController?.readAll() {
            if !data.isEmpty || data.count > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
    func testreadAllSorted() {
        if let data = self.dataController?.readAllSorted() {
            if !data.isEmpty || data.count > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
    func testnameforCurrency() {
        if let data = self.dataController?.nameforCurrency(currency: "USD") {
            if data.characters.count > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
}
