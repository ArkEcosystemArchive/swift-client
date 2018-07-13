// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class Delegates {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/delegates"
        }
    }
    
    public init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves the given delegate by its public key
    public func get(byKey publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/get", ["publicKey": publicKey], completionHandler: completionHandler)
    }
    
    /// Retrieves the given delegate by its username
    public func get(byName username: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/get", ["username": username], completionHandler: completionHandler)
    }
    
    /// Retrieves the total count of registered delegates
    public func count(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/count", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the delegate registration fee
    public func fee(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/fee", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the total amounts forged by a delegates
    public func forgedByAccount(withKey publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/forging/getForgedByAccount", ["generatorPublicKey": publicKey], completionHandler: completionHandler)
    }
    
    /// Retrieves all voters of a delegates
    public func voters(publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/voters", ["publicKey": publicKey], completionHandler: completionHandler)
    }
    
    /// Retrieves all delegates
    public func voters(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint, parameters, completionHandler: completionHandler)
    }
    
    /// Retrieves delegates based on a search query
    public func search(query: String, parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        // Combine search query with additional parameters, if available
        var params = ["q": query]
        if let parameters = parameters {
            for (key,value) in parameters {
                params.updateValue(String(describing: value), forKey:key)
            }
        }
        handleApiCall(endpoint + "/search", params, completionHandler: completionHandler)
    }
    
    /// Retrieves a list of delegates that will forge next
    public func nextForgers(publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getNextForgers", [:], completionHandler: completionHandler)
    }
}
