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

class BridgechainsTest: XCTestCase {

    private var bridgechains: Bridgechains?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/bridgechains"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost)
        bridgechains = Bridgechains(connection: connection, mockHandleApiGet, mockHandleApiPost)
    }

    func testBridgechainsGet() {
        let expectation = self.expectation(description: "Get bridgechain")
        var response: [String: Any]?
        bridgechains?.get(id: 12345, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/12345" )
        XCTAssert(parameters?.count == 0)
    }

    func testBridgechainsAll() {
        let expectation = self.expectation(description: "Get all bridgechains")
        var response: [String: Any]?
        bridgechains?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testBridgechainsSearch() {
        let expectation = self.expectation(description: "Search a bridgechain")
        var response: [String: Any]?
        bridgechains?.search(body: ["name": "Dummy Bridgechain Name"], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/search")
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
        XCTAssert(body!["name"] as! String == "Dummy Bridgechain Name")
    }

}
