// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class Loader {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/loader"
        }
    }
    
    public init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves the status
    public func status(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/status", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the syncing status
    public func syncStatus(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/status/sync", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the configuration
    public func autoconfigure(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/autoconfigure", [:], completionHandler: completionHandler)
    }
}
