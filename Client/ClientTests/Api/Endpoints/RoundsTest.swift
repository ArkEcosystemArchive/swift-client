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

class RoundsTest: XCTestCase {

    private var rounds: Rounds?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/rounds"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost)
        rounds = Rounds(connection: connection, mockHandleApiGet, mockHandleApiPost)
    }

    func testRoundsDelegates() {
        let expectation = self.expectation(description: "Get delegates for a round")
        var response: [String: Any]?
        rounds?.delegates(id: 12345, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/12345/delegates" )
        XCTAssert(parameters?.count == 0)
    }

}
