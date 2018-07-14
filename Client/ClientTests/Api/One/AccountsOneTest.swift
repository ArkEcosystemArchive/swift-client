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
    
    private func mockHandleApiCall(_ url: String, _ parameters: [String: Any]?, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        completionHandler(["url": url, "parameters": parameters])
    }
    
    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 1)
        accounts = One.Accounts(client: client, mockHandleApiCall)
    }
    
    func testAccountsGet() {
        accounts?.get(address: "dummyAddress", completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint)
            XCTAssert(parameters!["address"] as! String == "dummyAddress")
        })
    }
    
    func testAccountsBalance() {
        accounts?.balance(of: "dummyAddress", completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint + "/getBalance")
            XCTAssert(parameters!["address"] as! String == "dummyAddress")
        })
    }
    
    func testAccountsPublicKey() {
        accounts?.publicKey(of: "dummyAddress", completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint + "/getPublicKey")
            XCTAssert(parameters!["address"] as! String == "dummyAddress")
        })
    }
    
    func testAccountsDelegate() {
        accounts?.delegate(votedBy: "dummyAddress", completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint + "/delegates")
            XCTAssert(parameters!["address"] as! String == "dummyAddress")
        })
    }
    
    func testAccountsDelegateFee() {
        accounts?.delegateFee(completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint + "/delegates/fee")
            XCTAssert(parameters!.count == 0)
        })
    }
    
    func testAccountsTop() {
        accounts?.top(limit: 40, completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint + "/top")
            XCTAssert(parameters!["limit"] as! Int == 40)
            XCTAssert(parameters!["offset"] as! Int == 0)
        })
    }
    
    func testAccountsAll() {
        accounts?.all(limit: 40, completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint + "/getAllAccounts")
            XCTAssert(parameters!["limit"] as! Int == 40)
            XCTAssert(parameters!["offset"] as! Int == 0)
        })
    }
    
    func testAccountsCount() {
        accounts?.count(completionHandler: { (response) in
            let parameters = response!["parameters"] as! [String: Any]?
            XCTAssert(response!["url"] as! String == self.apiEndpoint + "/count")
            XCTAssert(parameters!.count == 0)
        })
    }
    
}
