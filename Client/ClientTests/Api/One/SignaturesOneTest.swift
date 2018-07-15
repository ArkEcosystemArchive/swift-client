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

class SignaturesOneTest: XCTestCase {
    
    private var signatures: One.Signatures?
    private let apiHost = "https://127.0.0.1:4003/api"
    private var apiEndpoint: String {
        get {
            return "\(apiHost)/signatures"
        }
    }
    
    override func setUp() {
        super.setUp()
        let client = ArkClient(host: apiHost, version: 1)
        signatures = One.Signatures(client: client, mockHandleApiGet)
    }
    
    func testSignaturesFee() {
        let expectation = self.expectation(description: "Get signatures fee")
        var response: Dictionary<String, Any>?
        signatures?.fee(completionHandler: { (res) in
            response = res
            expectation.fulfill()
        })
        waitForExpectations(timeout: 5, handler: nil)
        
        let parameters = response!["parameters"] as! [String: Any]?
        XCTAssert(response!["url"] as! String == "\(self.apiEndpoint)/fee")
        XCTAssert(parameters!.count == 0)
    }
    
}
