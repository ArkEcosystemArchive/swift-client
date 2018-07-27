//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

public extension Two {
    public class Wallets {

        private let connection: Connection
        private let apiGetHandler: ApiGetHandler
        private let apiPostHandler: ApiPostHandler
        private var endpoint: String {
            return "\(connection.host)/wallets"
        }

        public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet, _ apiPostHandler: @escaping ApiPostHandler = handleApiPost) {
            self.connection = connection
            self.apiGetHandler = apiGetHandler
            self.apiPostHandler = apiPostHandler
        }

        /// Retrieves the given wallet
        /// id can be one of: Username, Address or Public Key
        public func get(byName id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
        }

        public func get(byAddress id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
        }

        public func get(byKey id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
        }

        /// Retrieves all wallets
        public func all(limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler(endpoint, ["limit": limit, "page": page], completionHandler)
        }

        /// Retrieves top wallets
        public func top(limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/top", ["limit": limit, "page": page], completionHandler)
        }

        /// Retrieves all transactions of a given wallet
        public func transactions(byName id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions", ["limit": limit, "page": page], completionHandler)
        }

        public func transactions(byAddress id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions", ["limit": limit, "page": page], completionHandler)
        }

        public func transactions(byKey id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions", ["limit": limit, "page": page], completionHandler)
        }

        /// Retrieves all sent transactions of a given wallet
        public func sentTransactions(byName id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions/sent", ["limit": limit, "page": page], completionHandler)
        }

        public func sentTransactions(byAddress id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions/sent", ["limit": limit, "page": page], completionHandler)
        }

        public func sentTransactions(byKey id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions/sent", ["limit": limit, "page": page], completionHandler)
        }

        /// Retrieves all received transactions of a given wallet
        public func receivedTransactions(byName id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions/received", ["limit": limit, "page": page], completionHandler)
        }

        public func receivedTransactions(byAddress id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions/received", ["limit": limit, "page": page], completionHandler)
        }

        public func receivedTransactions(byKey id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions/received", ["limit": limit, "page": page], completionHandler)
        }

        /// Retrieves all votes of a wallet
        public func votes(byName id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/votes", ["limit": limit, "page": page], completionHandler)
        }

        public func votes(byAddress id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/votes", ["limit": limit, "page": page], completionHandler)
        }

        public func votes(byKey id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/votes", ["limit": limit, "page": page], completionHandler)
        }

        /// Searches for a wallet
        public func search(body: [String: Any]?, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiPostHandler("\(endpoint)/search", ["limit": limit, "page": page], body, completionHandler)
        }
    }
}
