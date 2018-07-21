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
    class Node {

        private let connection: Connection
        private let apiGetHandler: ApiGetHandler
        private var endpoint: String {
            return "\(connection.host)/node"
        }

        public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet) {
            self.connection = connection
            self.apiGetHandler = apiGetHandler
        }

        /// Retrieves the status
        public func status(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/status", [:], completionHandler)
        }

        /// Retrieves the node syncing status
        public func syncing(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/syncing", [:], completionHandler)
        }

        /// Retrieves the configuration
        public func configuration(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/configuration", [:], completionHandler)
        }
    }
}
