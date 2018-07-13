// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class Peers {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/peers"
        }
    }
    
    public init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves a peer
    public func get(ip: String, port: Int, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/get", ["ip": ip, "port": port], completionHandler: completionHandler)
    }
    
    /// Retrieves all peers, based on the given filter parameter(s)
    public func all(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint, parameters, completionHandler: completionHandler)
    }
    
    /// Retrieves the core version
    public func version(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/version", [:], completionHandler: completionHandler)
    }
}
