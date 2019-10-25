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

class LocksTest: XCTestCase {

    private var locks: Locks?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/locks"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost)
        locks = Locks(connection: connection, mockHandleApiGet, mockHandleApiPost)
    }

    func testLocksGet() {
        let expectation = self.expectation(description: "Get lock")
        var response: [String: Any]?
        locks?.get(id: "dummyLockId", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyLockId" )
        XCTAssert(parameters?.count == 0)
    }

    func testLocksAll() {
        let expectation = self.expectation(description: "Get all locks")
        var response: [String: Any]?
        locks?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testLocksSearch() {
        let expectation = self.expectation(description: "Search a lock")
        var response: [String: Any]?
        locks?.search(body: ["expirationValue": 12345], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/search")
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
        XCTAssert(body!["expirationValue"] as! Int == 12345)
    }

    func testLocksUnlocked() {
        let expectation = self.expectation(description: "Search an unlocked lock")
        var response: [String: Any]?
        locks?.unlocked(body: ["expirationValue": 12345], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/unlocked")
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
        XCTAssert(body!["expirationValue"] as! Int == 12345)
    }

}
