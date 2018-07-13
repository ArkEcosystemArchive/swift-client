// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class Blocks {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/blocks"
        }
    }
    
    public init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves the given block
    public func get(id: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/get", ["id": id], completionHandler: completionHandler)
    }
    
    /// Retrieves all blocks, based on the given filter parameter(s)
    public func all(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint, parameters, completionHandler: completionHandler)
    }
    
    /// Retrieves the blockchain epoch
    public func epoch(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getEpoch", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the blockchain height
    public func height(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getHeight", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the blockchain nethash
    public func nethash(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getNethash", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the transaction fee
    public func fee(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getFee", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the different network fees
    public func fees(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getFees", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the blockchain milestone
    public func milestone(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getMilestone", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the blockchain reward
    public func reward(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getReward", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the blockchain supply
    public func supply(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getSupply", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the blockchain status
    public func status(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getStatus", [:], completionHandler: completionHandler)
    }
}
