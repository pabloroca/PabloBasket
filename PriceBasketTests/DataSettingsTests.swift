//
//  DataSettingsTests.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 26/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import XCTest
@testable import PriceBasket

class DataSettingsTests: XCTestCase {
    
    var dataController: SettingsDataController?

    override func setUp() {
        super.setUp()
        
        self.dataController = SettingsDataController()
        self.dataController?.deleteAll()
        self.dataController?.setup()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.dataController?.deleteAll()
    }
    
    func testSetup() {
        if let data = self.dataController?.readAll(objectype: Settings.self) {
            if !data.isEmpty || data.count == 1 {
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
        if let data = self.dataController?.readAll(objectype: Settings.self) {
            if data.isEmpty || data.count == 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTAssert(true, "Pass")
        }
    }
    
    func testreadFirst() {
        if let _ = self.dataController?.readFirst() {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
    
    func testsetTSforCurrency() {
        self.dataController?.setTSforCurrency()
        if let data = self.dataController?.readFirst() {
            if data.tscurrency > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }

    func testsetTSforExchange() {
        self.dataController?.setTSforExchange()
        if let data = self.dataController?.readFirst() {
            if data.tsexchange > 0 {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }

    func testsetDefaultCurrency() {
        self.dataController?.setDefaultCurrency(currency: "EUR")
        if let data = self.dataController?.readFirst() {
            if data.currencyselected == "EUR" {
                XCTAssert(true, "Pass")
            } else {
                XCTFail()
            }
        } else {
            XCTFail()
        }
    }
    
    func testkeyforCurrencySelected() {
        let key = self.dataController?.keyforCurrencySelected()
        if key == "USD" {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
    
    func testnameforCurrencySelected() {
        DataCurrencyTests().setUp()
        let name = self.dataController?.nameforCurrencySelected()
        DataCurrencyTests().tearDown()
        if name == "United States Dollar" {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
        
    }
}
