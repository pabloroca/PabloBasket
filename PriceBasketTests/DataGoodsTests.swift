//
//  DataGoodsTests.swift
//  PriceBasket
//
//  Created by Pablo Roca Rozas on 26/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import XCTest
@testable import PriceBasket

class DataGoodsTests: XCTestCase {

    var dataController: GoodsDataController?

    override func setUp() {
        super.setUp()
        
        dataController = GoodsDataController()
        dataController?.deleteAll()
        dataController?.setup()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        dataController?.deleteAll()
    }
    
    func testSetup() {
        if let data = dataController?.readAll() {
            if !data.isEmpty || data.count == 4 {
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

    func testreadforKeyValid() {
        if let _ = dataController?.readforKey(id: 1) {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
    
    func testreadforKeyNonValid() {
        if let _ = dataController?.readforKey(id: 777) {
            XCTFail()
        } else {
            XCTAssert(true, "Pass")
        }
    }
}
