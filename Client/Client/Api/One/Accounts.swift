//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class Accounts {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/accounts"
        }
    }
    
    public init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves the given address
    public func get(address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint, ["address": address], completionHandler: completionHandler)
    }
    
    /// Retrieve the balance of the given address
    public func balance(of address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getBalance", ["address": address], completionHandler: completionHandler)
    }
    
    /// Retrieves the publicKey of the address
    public func publicKey(of address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getPublicKey", ["address": address], completionHandler: completionHandler)
    }
    
    /// Retrieves the delegate that the given address voted for
    public func delegate(votedBy address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/delegates", ["address": address], completionHandler: completionHandler)
    }
    
    /// Retrieves the current delegate registration fee
    public func delegateFee(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/delegates/fee", [:], completionHandler: completionHandler)
    }
    
    /// Retrieves the top accounts
    public func top(limit: Int = 20, offset: Int = 0, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/top", ["limit": limit, "offset": offset], completionHandler: completionHandler)
    }
    
    /// Retrieves a list of all accounts
    public func all(limit: Int = 20, offset: Int = 0, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/getAllAccounts", ["limit": limit, "offset": offset], completionHandler: completionHandler)
    }
    
    /// Retrieves the number of accounts
    func count(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/count", [:], completionHandler: completionHandler)
    }    
}
