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

class BusinessesTest: XCTestCase {

    private var businesses: Businesses?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/businesses"
    }

    override func setUp() {
        super.setUp()
        let connection = Connection(host: apiHost)
        businesses = Businesses(connection: connection, mockHandleApiGet, mockHandleApiPost)
    }

    func testBusinessesGet() {
        let expectation = self.expectation(description: "Get business")
        var response: [String: Any]?
        businesses?.get(id: 12345, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/12345" )
        XCTAssert(parameters?.count == 0)
    }

    func testBusinessesAll() {
        let expectation = self.expectation(description: "Get all businesses")
        var response: [String: Any]?
        businesses?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testBusinessesBridgechains() {
        let expectation = self.expectation(description: "Get bridgechains for a business")
        var response: [String: Any]?
        businesses?.bridgechains(ofBusiness: 12345, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/12345/bridgechains")
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testBusinessesSearch() {
        let expectation = self.expectation(description: "Search a business")
        var response: [String: Any]?
        businesses?.search(body: ["name": "Dummy Business Name"], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        let body = response!["body"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/search")
        XCTAssert(parameters!["limit"] as! Int == 100)
        XCTAssert(parameters!["page"] as! Int == 1)
        XCTAssert(body!["name"] as! String == "Dummy Business Name")
    }

}
