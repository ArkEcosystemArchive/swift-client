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

class BlocksTest: XCTestCase {

    private var blocks: Blocks?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/blocks"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost)
        blocks = Blocks(connection: connection, mockHandleApiGet, mockHandleApiPost)
    }

    func testBlocksGet() {
        let expectation = self.expectation(description: "Get block")
        var response: [String: Any]?
        blocks?.get(id: "dummyBlockId", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyBlockId" )
        XCTAssert(parameters?.count == 0)
    }

    func testBlocksAll() {
        let expectation = self.expectation(description: "Get all blocks")
        var response: [String: Any]?
        blocks?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testBlocksTransactions() {
        let expectation = self.expectation(description: "Get transactions for a block")
        var response: [String: Any]?
        blocks?.transactions(ofBlock: "dummyBlockId", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyBlockId/transactions")
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testBlocksSearch() {
        let expectation = self.expectation(description: "Search a block")
        var response: [String: Any]?
        blocks?.search(body: ["totalAmount": 100000000], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/search")
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
        XCTAssert(body!["totalAmount"] as! Int == 100000000)
    }

}
