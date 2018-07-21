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

class LoaderOneTest: XCTestCase {

    private var loader: One.Loader?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/loader"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost, version: 1)
        loader = One.Loader(connection: connection, mockHandleApiGet)
    }

    func testLoaderStatus() {
        let expectation = self.expectation(description: "Get loader status")
        var response: [String: Any]?
        loader?.status(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/status")
        XCTAssert(parameters!.count == 0)
    }

    func testLoaderSyncStatus() {
        let expectation = self.expectation(description: "Get loader sync status")
        var response: [String: Any]?
        loader?.syncStatus(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/status/sync")
        XCTAssert(parameters!.count == 0)
    }

    func testLoaderConfiguration() {
        let expectation = self.expectation(description: "Get loader configuration")
        var response: [String: Any]?
        loader?.autoconfigure(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/autoconfigure")
        XCTAssert(parameters!.count == 0)
    }

}
