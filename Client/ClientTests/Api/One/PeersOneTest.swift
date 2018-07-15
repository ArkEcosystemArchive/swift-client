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

class PeersOneTest: XCTestCase {
    
    private var peers: One.Peers?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        get {
            return "\(apiHost)/peers"
        }
    }
    
    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 1)
        peers = One.Peers(client: client, mockHandleApiGet)
    }
    
    func testPeersGet() {
        let expectation = self.expectation(description: "Get peer")
        var response: Dictionary<String, Any>?
        peers?.get(ip: "0.0.0.0", port: 0, completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/get")
        XCTAssert(parameters!["ip"] as! String == "0.0.0.0")
        XCTAssert(parameters!["port"] as! Int == 0)
    }
    
    func testPeersAll() {
        let expectation = self.expectation(description: "Get all peers")
        var response: Dictionary<String, Any>?
        peers?.all(parameters: ["status": "dummy", "limit": 10], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["status"] as! String == "dummy")
        XCTAssert(parameters!["limit"] as! Int == 10)
    }
    
    func testPeerVersion() {
        let expectation = self.expectation(description: "Get version")
        var response: Dictionary<String, Any>?
        peers?.version(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/version")
        XCTAssert(parameters!.count == 0)
    }
    
}
