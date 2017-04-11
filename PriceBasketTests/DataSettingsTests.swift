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
        
        dataController = SettingsDataController()
        dataController?.deleteAll()
        dataController?.setup()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        dataController?.deleteAll()
    }
    
    func testSetup() {
        if let data = dataController?.readAll(objectype: Settings.self) {
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
        dataController?.deleteAll()
        if let data = dataController?.readAll(objectype: Settings.self) {
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
        if let _ = dataController?.readFirst() {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
    
    func testsetTSforCurrency() {
        dataController?.setTSforCurrency()
        if let data = dataController?.readFirst() {
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
        dataController?.setTSforExchange()
        if let data = dataController?.readFirst() {
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
        dataController?.setDefaultCurrency(currency: "EUR")
        if let data = dataController?.readFirst() {
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
        let key = dataController?.keyforCurrencySelected()
        if key == "USD" {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
    
    func testnameforCurrencySelected() {
        DataCurrencyTests().setUp()
        let name = dataController?.nameforCurrencySelected()
        DataCurrencyTests().tearDown()
        if name == "United States Dollar" {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
        
    }
}
