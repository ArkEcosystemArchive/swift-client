// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class Transactions {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/transactions"
        }
    }
    
    public init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves a transaction
    public func get(id: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/get", ["id": id], completionHandler: completionHandler)
    }
    
    /// Retrieves all transactions, based on the given filter parameter(s)
    public func all(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint, parameters, completionHandler: completionHandler)
    }
    
    /// Retrieves an unconfirmed transaction
    public func getUnconfirmed(id: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/unconfirmed/get", ["id": id], completionHandler: completionHandler)
    }
    
    /// Retrieves all unconfirmed transactions, based on the given filter parameter(s)
    public func allUnconfirmed(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
        handleApiCall(endpoint + "/unconfirmed", parameters, completionHandler: completionHandler)
    }
}
