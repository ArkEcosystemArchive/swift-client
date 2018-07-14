//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

extension One {
    class Accounts {
        
        private let client: ArkClient
        private let apiHandler: ApiHandler
        private var endpoint: String {
            get {
                return client.host + "/accounts"
            }
        }
        
        public init(client: ArkClient, _ apiHandler: @escaping ApiHandler = handleApiCall) {
            self.client = client
            self.apiHandler = apiHandler
        }
        
        /// Retrieves the given address
        public func get(address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint, ["address": address], completionHandler)
        }
        
        /// Retrieve the balance of the given address
        public func balance(of address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/getBalance", ["address": address], completionHandler)
        }
        
        /// Retrieves the publicKey of the address
        public func publicKey(of address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/getPublicKey", ["address": address], completionHandler)
        }
        
        /// Retrieves the delegate that the given address voted for
        public func delegate(votedBy address: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/delegates", ["address": address], completionHandler)
        }
        
        /// Retrieves the current delegate registration fee
        public func delegateFee(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/delegates/fee", [:], completionHandler)
        }
        
        /// Retrieves the top accounts
        public func top(limit: Int = 20, offset: Int = 0, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/top", ["limit": limit, "offset": offset], completionHandler)
        }
        
        /// Retrieves a list of all accounts
        public func all(limit: Int = 20, offset: Int = 0, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/getAllAccounts", ["limit": limit, "offset": offset], completionHandler)
        }
        
        /// Retrieves the number of accounts
        func count(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/count", [:], completionHandler)
        }
    }
}
