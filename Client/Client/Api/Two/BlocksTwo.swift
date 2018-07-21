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

        private let connection: Connection
        private let apiGetHandler: ApiGetHandler
        private let apiPostHandler: ApiPostHandler
        private var endpoint: String {
            return "\(connection.host)/blocks"
        }

        public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet, _ apiPostHandler: @escaping ApiPostHandler = handleApiPost) {
            self.connection = connection
            self.apiGetHandler = apiGetHandler
            self.apiPostHandler = apiPostHandler
        }

        /// Retrieves the given block
        public func get(id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
        }

        /// Retrieves all blocks
        public func all(limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler(endpoint, ["limit": limit, "page": page], completionHandler)
        }

        /// Retrieves transactions for a given block
        public func transactions(ofBlock id: String, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)/transactions", ["limit": limit, "page": page], completionHandler)
        }

        /// Searches for a block
        public func search(body: [String: Any]?, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiPostHandler("\(endpoint)/search", ["limit": limit, "page": page], body, completionHandler)
        }
    }
}
