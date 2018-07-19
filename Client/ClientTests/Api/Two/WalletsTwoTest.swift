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

class WalletsTwoTest: XCTestCase {

    private var wallets: Two.Wallets?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/wallets"
    }

    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 2)
        wallets = Two.Wallets(client: client, mockHandleApiGet, mockHandleApiPost)
    }

    func testWalletsGetName() {
        let expectation = self.expectation(description: "Get wallet by name")
        var response: [String: Any]?
        wallets?.get(byName: "dummyWalletName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletName" )
        XCTAssert(parameters?.count == 0)
    }

    func testWalletsGetAddress() {
        let expectation = self.expectation(description: "Get wallet by address")
        var response: [String: Any]?
        wallets?.get(byAddress: "dummyWalletAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletAddress" )
        XCTAssert(parameters?.count == 0)
    }

    func testWalletsGetKey() {
        let expectation = self.expectation(description: "Get wallet by public key")
        var response: [String: Any]?
        wallets?.get(byKey: "dummyWalletKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletKey" )
        XCTAssert(parameters?.count == 0)
    }

    func testWalletsAll() {
        let expectation = self.expectation(description: "Get all wallets")
        var response: [String: Any]?
        wallets?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsTop() {
        let expectation = self.expectation(description: "Get top wallets")
        var response: [String: Any]?
        wallets?.top(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/top" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsTransactionsName() {
        let expectation = self.expectation(description: "Get transactions of wallet by name")
        var response: [String: Any]?
        wallets?.transactions(byName: "dummyWalletName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletName/transactions" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsTransactionsAddress() {
        let expectation = self.expectation(description: "Get transactions of wallet by address")
        var response: [String: Any]?
        wallets?.transactions(byAddress: "dummyWalletAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletAddress/transactions" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsTransactionsKey() {
        let expectation = self.expectation(description: "Get transactions of wallet by public key")
        var response: [String: Any]?
        wallets?.transactions(byKey: "dummyWalletKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletKey/transactions" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsSentTransactionsName() {
        let expectation = self.expectation(description: "Get sent transactions of wallet by name")
        var response: [String: Any]?
        wallets?.sentTransactions(byName: "dummyWalletName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletName/transactions/sent" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsSentTransactionsAddress() {
        let expectation = self.expectation(description: "Get sent transactions of wallet by address")
        var response: [String: Any]?
        wallets?.sentTransactions(byAddress: "dummyWalletAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletAddress/transactions/sent" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsSentTransactionsKey() {
        let expectation = self.expectation(description: "Get sent transactions of wallet by public key")
        var response: [String: Any]?
        wallets?.sentTransactions(byKey: "dummyWalletKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletKey/transactions/sent" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsReceivedTransactionsName() {
        let expectation = self.expectation(description: "Get received transactions of wallet by name")
        var response: [String: Any]?
        wallets?.receivedTransactions(byName: "dummyWalletName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletName/transactions/received" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsReceivedTransactionsAddress() {
        let expectation = self.expectation(description: "Get received transactions of wallet by address")
        var response: [String: Any]?
        wallets?.receivedTransactions(byAddress: "dummyWalletAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletAddress/transactions/received" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsReceivedTransactionsKey() {
        let expectation = self.expectation(description: "Get received transactions of wallet by public key")
        var response: [String: Any]?
        wallets?.receivedTransactions(byKey: "dummyWalletKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletKey/transactions/received" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsVotesName() {
        let expectation = self.expectation(description: "Get votes of wallet by name")
        var response: [String: Any]?
        wallets?.votes(byName: "dummyWalletName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletName/votes" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsVotesAddress() {
        let expectation = self.expectation(description: "Get votes of wallet by address")
        var response: [String: Any]?
        wallets?.votes(byAddress: "dummyWalletAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletAddress/votes" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletsVotesKey() {
        let expectation = self.expectation(description: "Get votes of wallet by public key")
        var response: [String: Any]?
        wallets?.votes(byKey: "dummyWalletKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyWalletKey/votes" )
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testWalletSearch() {
        let expectation = self.expectation(description: "Search a wallet")
        var response: [String: Any]?
        wallets?.search(body: ["balance": 100000000], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/search")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
        XCTAssert(body!["balance"] as! Int == 100000000)
    }

}
