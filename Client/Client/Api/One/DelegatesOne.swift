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
    class Delegates {
        
        private let client: ArkClient
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            get {
                return client.host + "/delegates"
            }
        }
        
        public init(client: ArkClient, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiHandler = apiHandler
        }
        
        /// Retrieves the given delegate by its public key
        public func get(byKey publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/get", ["publicKey": publicKey], completionHandler)
        }
        
        /// Retrieves the given delegate by its username
        public func get(byName username: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/get", ["username": username], completionHandler)
        }
        
        /// Retrieves the total count of registered delegates
        public func count(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/count", [:], completionHandler)
        }
        
        /// Retrieves the delegate registration fee
        public func fee(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/fee", [:], completionHandler)
        }
        
        /// Retrieves the total amounts forged by a delegates
        public func forgedByAccount(withKey publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/forging/getForgedByAccount", ["generatorPublicKey": publicKey], completionHandler)
        }
        
        /// Retrieves all voters of a delegates
        public func voters(publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/voters", ["publicKey": publicKey], completionHandler)
        }
        
        /// Retrieves all delegates
        public func voters(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint, parameters, completionHandler)
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
            apiHandler(endpoint + "/search", params, completionHandler)
        }
        
        /// Retrieves a list of delegates that will forge next
        public func nextForgers(publicKey: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/getNextForgers", [:], completionHandler)
        }
    }
}
