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

class DelegatesTwoTest: XCTestCase {

    private var delegates: Two.Delegates?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        return "\(apiHost)/delegates"
    }

    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 2)
        delegates = Two.Delegates(client: client, mockHandleApiGet)
    }

    func testDelegatesGetName() {
        let expectation = self.expectation(description: "Get delegate by username")
        var response: [String: Any]?
        delegates?.get(byName: "dummyDelegateName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateName" )
        XCTAssert(parameters?.count == 0)
    }

    func testDelegatesGetAddress() {
        let expectation = self.expectation(description: "Get delegate by address")
        var response: [String: Any]?
        delegates?.get(byAddress: "dummyDelegateAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateAddress" )
        XCTAssert(parameters?.count == 0)
    }

    func testDelegatesGetKey() {
        let expectation = self.expectation(description: "Get delegate by public key")
        var response: [String: Any]?
        delegates?.get(byKey: "dummyDelegateKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateKey" )
        XCTAssert(parameters?.count == 0)
    }

    func testDelegatesAll() {
        let expectation = self.expectation(description: "Get all delegates")
        var response: [String: Any]?
        delegates?.all(limit: 40, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testDelegatesBlockName() {
        let expectation = self.expectation(description: "Get blocks by delegate username")
        var response: [String: Any]?
        delegates?.blocks(byName: "dummyDelegateName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateName/blocks")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testDelegatesBlockAddress() {
        let expectation = self.expectation(description: "Get blocks by delegate address")
        var response: [String: Any]?
        delegates?.blocks(byAddress: "dummyDelegateAddress", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateAddress/blocks")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testDelegatesBlockKey() {
        let expectation = self.expectation(description: "Get blocks by delegate public key")
        var response: [String: Any]?
        delegates?.blocks(byKey: "dummyDelegateKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateKey/blocks")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testDelegatesVotersName() {
        let expectation = self.expectation(description: "Get voters by delegate username")
        var response: [String: Any]?
        delegates?.voters(byName: "dummyDelegateName", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateName/voters")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testDelegatesVotersAddress() {
        let expectation = self.expectation(description: "Get voters by delegate address")
        var response: [String: Any]?
        delegates?.voters(byAddress: "dummyDelegateKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateKey/voters")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

    func testDelegatesVotersKey() {
        let expectation = self.expectation(description: "Get voters by delegate public key")
        var response: [String: Any]?
        delegates?.voters(byKey: "dummyDelegateKey", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)

        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/dummyDelegateKey/voters")
        XCTAssert(parameters!["limit"] as! Int == 20)
        XCTAssert(parameters!["page"] as! Int == 1)
    }

}
