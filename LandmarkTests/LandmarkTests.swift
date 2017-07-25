//
//  LandmarkTests.swift
//  LandmarkTests
//
//  Created by Mohamed Magdy on 7/23/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import XCTest
@testable import Landmark

class LandmarkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIResponse() {
        
        let expectations: XCTestExpectation = expectation(description: "Testing Products API")
        let productStore  : LMProductsStore      = LMProductsStore()
        productStore.getProducts(success: { (model) in
            let products: [LMProductViewModel]? = model as? [LMProductViewModel]
            XCTAssertNotNil(products)
            XCTAssert(products!.count > 0)
            XCTAssertNotNil(products?.first?.name)
            expectations.fulfill()
        }) { (error) in
            XCTFail("##ERROR happened: \(error)")
            expectations.fulfill()
        }
        waitForExpectations(timeout: 10.0) { error in
            if let error = error {
                XCTFail("waitForExpectationsTimeout error: \(error)")
            }
        }
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {[weak self] in
            self?.testAPIResponse()
        }
    }
    
}
