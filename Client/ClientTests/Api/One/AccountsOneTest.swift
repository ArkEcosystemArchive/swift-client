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

class AccountsOneTest: XCTestCase {
    
    private var accounts: One.Accounts?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        get {
            return apiHost + "/accounts"
        }
    }
    
    private func mockHandleApiGet(_ url: String, _ parameters: [String: Any]?, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        completionHandler(["url": url, "parameters": parameters])
    }
    
    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 1)
        accounts = One.Accounts(client: client, mockHandleApiGet)
    }
    
    func testAccountsGet() {
        let expectation = self.expectation(description: "Get account")
        var response: Dictionary<String, Any>?
        accounts?.get(address: "dummyAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["address"] as! String == "dummyAddress")
    }
    
    func testAccountsBalance() {
        let expectation = self.expectation(description: "Get account balance")
        var response: Dictionary<String, Any>?
        accounts?.balance(of: "dummyAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint + "/getBalance")
        XCTAssert(parameters!["address"] as! String == "dummyAddress")
    }
    
    func testAccountsPublicKey() {
        let expectation = self.expectation(description: "Get account public key")
        var response: Dictionary<String, Any>?
        accounts?.publicKey(of: "dummyAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint + "/getPublicKey")
        XCTAssert(parameters!["address"] as! String == "dummyAddress")
    }
    
    func testAccountsDelegate() {
        let expectation = self.expectation(description: "Get account delegate")
        var response: Dictionary<String, Any>?
        accounts?.delegate(votedBy: "dummyAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint + "/delegates")
        XCTAssert(parameters!["address"] as! String == "dummyAddress")
    }
    
    func testAccountsDelegateFee() {
        let expectation = self.expectation(description: "Get delegate fee")
        var response: Dictionary<String, Any>?
        accounts?.delegateFee(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint + "/delegates/fee")
        XCTAssert(parameters!.count == 0)
    }
    
    func testAccountsTop() {
        let expectation = self.expectation(description: "Get top accounts")
        var response: Dictionary<String, Any>?
        accounts?.top(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint + "/top")
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["offset"] as! Int == 0)
    }
    
    func testAccountsAll() {
        let expectation = self.expectation(description: "Get all accounts")
        var response: Dictionary<String, Any>?
        accounts?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint + "/getAllAccounts")
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["offset"] as! Int == 0)
    }
    
    func testAccountsCount() {
        let expectation = self.expectation(description: "Get accounts count")
        var response: Dictionary<String, Any>?
        accounts?.count(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint + "/count")
        XCTAssert(parameters!.count == 0)
    }
    
}
