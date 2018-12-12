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

class VotesTwoTest: XCTestCase {

    private var votes: Two.Votes?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/votes"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost, version: 2)
        votes = Two.Votes(connection: connection, mockHandleApiGet)
    }

    func testVotesStatus() {
        let expectation = self.expectation(description: "Get a vote")
        var response: [String: Any]?
        votes?.get(id: "dummyId", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyId" )
        XCTAssert(parameters?.count == 0)
    }

    func testVotesAll() {
        let expectation = self.expectation(description: "Get all votes")
        var response: [String: Any]?
        votes?.all(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

}
