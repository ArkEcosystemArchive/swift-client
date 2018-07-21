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

class TransactionsOneTest: XCTestCase {

    private var transactions: One.Transactions?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/transactions"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost, version: 1)
        transactions = One.Transactions(connection: connection, mockHandleApiGet)
    }

    func testTransactionsGet() {
        let expectation = self.expectation(description: "Get transaction")
        var response: [String: Any]?
        transactions?.get(id: "dummyId", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/get")
        XCTAssert(parameters!["id"] as! String == "dummyId")
    }

    func testTransactionsAll() {
        let expectation = self.expectation(description: "Get all transactions")
        var response: [String: Any]?
        transactions?.all(parameters: ["limit": 40, "amount": "dummyAmount"], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["amount"] as! String == "dummyAmount")
    }

    func testTransactionsGetUnconfirmed() {
        let expectation = self.expectation(description: "Get unconfirmed transaction")
        var response: [String: Any]?
        transactions?.getUnconfirmed(id: "dummyId", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/unconfirmed/get")
        XCTAssert(parameters!["id"] as! String == "dummyId")
    }

    func testTransactionsAllUnconfirmed() {
        let expectation = self.expectation(description: "Get all unconfirmed transactions")
        var response: [String: Any]?
        transactions?.allUnconfirmed(parameters: ["limit": 40, "amount": "dummyAmount"], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/unconfirmed")
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["amount"] as! String == "dummyAmount")
    }

}
