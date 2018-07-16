//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation
import XCTest
@testable import Client

class DelegatesOneTest: XCTestCase {
    
    private var delegates: One.Delegates?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        get {
            return "\(apiHost)/delegates"
        }
    }
    
    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 1)
        delegates = One.Delegates(client: client, mockHandleApiGet)
    }
    
    func testDelegatesGetByName() {
        let expectation = self.expectation(description: "Get delegate by username")
        var response: Dictionary<String, Any>?
        delegates?.get(byName: "dummyName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/get")
        XCTAssert(parameters!["username"] as! String == "dummyName")
    }
    
    func testDelegatesGetByKey() {
        let expectation = self.expectation(description: "Get delegate by public key")
        var response: Dictionary<String, Any>?
        delegates?.get(byKey: "dummyKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/get")
        XCTAssert(parameters!["publicKey"] as! String == "dummyKey")
    }
    
    func testDelegatesCount() {
        let expectation = self.expectation(description: "Get delegate count")
        var response: Dictionary<String, Any>?
        delegates?.count(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/count")
        XCTAssert(parameters!.count == 0)
    }
    
    func testDelegatesFee() {
        let expectation = self.expectation(description: "Get delegate registration fee")
        var response: Dictionary<String, Any>?
        delegates?.fee(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/fee")
        XCTAssert(parameters!.count == 0)
    }
    
    func testDelegatesForged() {
        let expectation = self.expectation(description: "Get delegate forged amounts")
        var response: Dictionary<String, Any>?
        delegates?.forgedByAccount(withKey: "dummyKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/forging/getForgedByAccount")
        XCTAssert(parameters!["generatorPublicKey"] as! String == "dummyKey")
    }
    
    func testDelegatesVoters() {
        let expectation = self.expectation(description: "Get delegate voters")
        var response: Dictionary<String, Any>?
        delegates?.voters(publicKey: "dummyKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/voters")
        XCTAssert(parameters!["publicKey"] as! String == "dummyKey")
    }
    
    func testDelegatesAll() {
        let expectation = self.expectation(description: "Get all delegates")
        var response: Dictionary<String, Any>?
        delegates?.all(parameters: ["limit": 40, "orderBy": "dummyOrder"], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["orderBy"] as! String == "dummyOrder")
    }
    
    func testDelegatesSearch() {
        let expectation = self.expectation(description: "Search a delegate")
        var response: Dictionary<String, Any>?
        delegates?.search(query: "dummyQuery", parameters: ["limit": 40], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/search")
        XCTAssert(parameters!["limit"] as! String == "40")
        XCTAssert(parameters!["q"] as! String == "dummyQuery")
    }
    
}
