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

class BlocksOneTest: XCTestCase {
    
    private var blocks: One.Blocks?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        get {
            return "\(apiHost)/blocks"
        }
    }
    
    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 1)
        blocks = One.Blocks(client: client, mockHandleApiGet)
    }
    
    func testBlocksGet() {
        let expectation = self.expectation(description: "Get block")
        var response: Dictionary<String, Any>?
        blocks?.get(id: "dummyBlockId", completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/get" )
        XCTAssert(parameters!["id"] as! String == "dummyBlockId")
    }
    
    func testBlocksAll() {
        let expectation = self.expectation(description: "Get all blocks")
        var response: Dictionary<String, Any>?
        blocks?.all(parameters: ["limit": 40, "totalAmount": 100000000], completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == self.apiEndpoint)
        XCTAssert(parameters!["limit"] as! Int == 40)
        XCTAssert(parameters!["totalAmount"] as! Int == 100000000)
    }
    
    func testBlocksEpoch() {
        let expectation = self.expectation(description: "Get epoch")
        var response: Dictionary<String, Any>?
        blocks?.epoch(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getEpoch")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksHeight() {
        let expectation = self.expectation(description: "Get height")
        var response: Dictionary<String, Any>?
        blocks?.height(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getHeight")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksNethash() {
        let expectation = self.expectation(description: "Get nethash")
        var response: Dictionary<String, Any>?
        blocks?.nethash(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getNethash")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksFee() {
        let expectation = self.expectation(description: "Get fee")
        var response: Dictionary<String, Any>?
        blocks?.fee(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getFee")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksFees() {
        let expectation = self.expectation(description: "Get fees")
        var response: Dictionary<String, Any>?
        blocks?.fees(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getFees")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksMilestone() {
        let expectation = self.expectation(description: "Get milestone")
        var response: Dictionary<String, Any>?
        blocks?.milestone(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getMilestone")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksReward() {
        let expectation = self.expectation(description: "Get reward")
        var response: Dictionary<String, Any>?
        blocks?.reward(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getReward")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksSupply() {
        let expectation = self.expectation(description: "Get supply")
        var response: Dictionary<String, Any>?
        blocks?.supply(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getSupply")
        XCTAssert(parameters!.count == 0)
    }
    
    func testBlocksStatus() {
        let expectation = self.expectation(description: "Get status")
        var response: Dictionary<String, Any>?
        blocks?.status(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/getStatus")
        XCTAssert(parameters!.count == 0)
    }
    
}
