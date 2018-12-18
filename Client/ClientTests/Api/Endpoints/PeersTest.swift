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

class PeersTest: XCTestCase {

    private var peers: Peers?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/peers"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost)
        peers = Peers(connection: connection, mockHandleApiGet)
    }

    func testPeersStatus() {
        let expectation = self.expectation(description: "Get peer status")
        var response: [String: Any]?
        peers?.status(ip: "0.0.0.0", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/0.0.0.0" )
        XCTAssert(parameters?.count == 0)
    }

    func testPeersAll() {
        let expectation = self.expectation(description: "Get all peers")
        var response: [String: Any]?
        peers?.all(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

}
