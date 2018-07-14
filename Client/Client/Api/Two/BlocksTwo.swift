// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

extension Two {
    class Blocks {
        
        private let client: ArkClient
        private let apiHandler: ApiHandler
        private var endpoint: String {
            get {
                return client.host + "/blocks"
            }
        }
        
        public init(client: ArkClient, _ apiHandler: @escaping ApiHandler = handleApiCall) {
            self.client = client
            self.apiHandler = apiHandler
        }
        
        /// Retrieves the given block
        public func get(id: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/" + id, [:], completionHandler)
        }
        
        /// Retrieves all blocks
        public func all(limit: Int = 20, page: Int = 1, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint, ["limit": limit, "page": page], completionHandler)
        }
        
        /// Retrieves transactions for a given block
        public func transactions(ofBlock id: String, limit: Int = 20, page : Int = 1, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/" + id, ["limit": limit, "page": page], completionHandler)
        }
        
        /// Searches for a transaction
        public func search(limit: Int = 20, page : Int = 1, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            // TODO: add apiPostHandler, etc.
            // apiHandler(endpoint + "/search", ["limit": limit, "page": page], completionHandler)
        }
    }
}
