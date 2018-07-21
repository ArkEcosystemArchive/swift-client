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

        private let connection: Connection
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            return "\(connection.host)/blocks"
        }

        public init(connection: Connection, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.connection = connection
            self.apiHandler = apiHandler
        }

        /// Retrieves the given block
        public func get(id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/get", ["id": id], completionHandler)
        }

        /// Retrieves all blocks, based on the given filter parameter(s)
        public func all(parameters: [String: Any]? = nil, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler(endpoint, parameters, completionHandler)
        }

        /// Retrieves the blockchain epoch
        public func epoch(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getEpoch", [:], completionHandler)
        }

        /// Retrieves the blockchain height
        public func height(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getHeight", [:], completionHandler)
        }

        /// Retrieves the blockchain nethash
        public func nethash(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getNethash", [:], completionHandler)
        }

        /// Retrieves the transaction fee
        public func fee(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getFee", [:], completionHandler)
        }

        /// Retrieves the different network fees
        public func fees(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getFees", [:], completionHandler)
        }

        /// Retrieves the blockchain milestone
        public func milestone(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getMilestone", [:], completionHandler)
        }

        /// Retrieves the blockchain reward
        public func reward(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getReward", [:], completionHandler)
        }

        /// Retrieves the blockchain supply
        public func supply(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getSupply", [:], completionHandler)
        }

        /// Retrieves the blockchain status
        public func status(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/getStatus", [:], completionHandler)
        }
    }
}
