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

class NodeTest: XCTestCase {

    private var node: Node?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/node"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost)
        node = Node(connection: connection, mockHandleApiGet)
    }

    func testNodeStatus() {
        let expectation = self.expectation(description: "Get node status")
        var response: [String: Any]?
        node?.status(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/status" )
        XCTAssert(parameters?.count == 0)
    }

    func testNodeSyncing() {
        let expectation = self.expectation(description: "Get node syncing status")
        var response: [String: Any]?
        node?.syncing(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/syncing" )
        XCTAssert(parameters?.count == 0)
    }

    func testNodeConfiguration() {
        let expectation = self.expectation(description: "Get node configuration")
        var response: [String: Any]?
        node?.configuration(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/configuration" )
        XCTAssert(parameters?.count == 0)
    }

}
