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
    class Blocks {
        
        private let client: ArkClient
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            get {
                return "\(client.host)/blocks"
            }
        }
        
        public init(client: ArkClient, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiHandler = apiHandler
        }
        
        /// Retrieves the given block
        public func get(id: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/get", ["id": id], completionHandler)
        }
        
        /// Retrieves all blocks, based on the given filter parameter(s)
        public func all(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint, parameters, completionHandler)
        }
        
        /// Retrieves the blockchain epoch
        public func epoch(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getEpoch", [:], completionHandler)
        }
        
        /// Retrieves the blockchain height
        public func height(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getHeight", [:], completionHandler)
        }
        
        /// Retrieves the blockchain nethash
        public func nethash(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getNethash", [:], completionHandler)
        }
        
        /// Retrieves the transaction fee
        public func fee(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getFee", [:], completionHandler)
        }
        
        /// Retrieves the different network fees
        public func fees(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getFees", [:], completionHandler)
        }
        
        /// Retrieves the blockchain milestone
        public func milestone(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getMilestone", [:], completionHandler)
        }
        
        /// Retrieves the blockchain reward
        public func reward(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getReward", [:], completionHandler)
        }
        
        /// Retrieves the blockchain supply
        public func supply(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getSupply", [:], completionHandler)
        }
        
        /// Retrieves the blockchain status
        public func status(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/getStatus", [:], completionHandler)
        }
    }
}
