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

class TransactionsTwoTest: XCTestCase {

    private var transactions: Two.Transactions?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/transactions"
    }

    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 2)
        transactions = Two.Transactions(client: client, mockHandleApiGet, mockHandleApiPost)
    }

    func testTransactionsCreate() {
        let expectation = self.expectation(description: "Create transaction(s)")
        var response: [String: Any]?
        transactions?.create(body: ["id": "dummyTransactionId"], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters?.count == 0)
        XCTAssert(body!["id"] as! String == "dummyTransactionId")
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
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyId")
        XCTAssert(parameters?.count == 0)
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
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/unconfirmed/dummyId")
        XCTAssert(parameters?.count == 0)
    }

    func testTransactionsAll() {
        let expectation = self.expectation(description: "Get all transactions")
        var response: [String: Any]?
        transactions?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testTransactionsAllUnconfirmed() {
        let expectation = self.expectation(description: "Get all unconfirmed transactions")
        var response: [String: Any]?
        transactions?.allUnconfirmed(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/unconfirmed")
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testTransactionsTypes() {
        let expectation = self.expectation(description: "Get transaction types")
        var response: [String: Any]?
        transactions?.types(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/types")
        XCTAssert(parameters?.count == 0)
    }

    func testTransactionsSearch() {
        let expectation = self.expectation(description: "Search a transaction")
        var response: [String: Any]?
        transactions?.search(body: ["amount": 100000000], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/search")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
        XCTAssert(body!["amount"] as! Int == 100000000)
    }

}
