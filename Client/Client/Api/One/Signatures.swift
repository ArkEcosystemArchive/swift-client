// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class Signatures {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/signatures"
        }
    }
    
    public init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves the fee for a second signature
    public func fee(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/fee", [:], completionHandler: completionHandler)
    }
}
