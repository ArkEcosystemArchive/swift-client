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
    public class Peers {

        private let connection: Connection
        private let apiGetHandler: ApiGetHandler
        private var endpoint: String {
            return "\(connection.host)/peers"
        }

        public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet) {
            self.connection = connection
            self.apiGetHandler = apiGetHandler
        }

        /// Retrieves a peer
        public func status(ip: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(ip)", [:], completionHandler)
        }

        /// Retrieves all peers
        public func all(limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler(endpoint, ["limit": limit, "page": page], completionHandler)
        }
    }
}
