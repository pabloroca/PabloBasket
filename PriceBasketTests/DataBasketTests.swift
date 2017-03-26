//
//  DataBasketTests.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 26/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import XCTest
@testable import PriceBasket

class DataBasketTests: XCTestCase {
    
    var dataController: BasketDataControler?

    override func setUp() {
        super.setUp()
        
        DataCurrencyTests().setUp()
        DataExchangeTests().setUp()
        
        self.dataController = BasketDataControler()
        self.dataController?.deleteAll()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.dataController?.deleteAll()
        DataCurrencyTests().tearDown()
        DataExchangeTests().tearDown()
    }
    
    func testupdate() {
        self.dataController?.update(fkid: 2, units: 2)
        
        if let basket = self.dataController?.readforKey(fkid: 2) {
            if basket.fkid == 2 && basket.units == 2 {
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
    
    func testcalculateBasket() {
        self.dataController?.update(fkid: 2, units: 2)
        let total = self.dataController?.calculateBasket()
        if total == 4.2 {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
}
