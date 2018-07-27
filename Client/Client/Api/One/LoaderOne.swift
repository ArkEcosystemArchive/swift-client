// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

public extension One {
    public class Loader {

        private let connection: Connection
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            return "\(connection.host)/loader"
        }

        public init(connection: Connection, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.connection = connection
            self.apiHandler = apiHandler
        }

        /// Retrieves the status
        public func status(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/status", [:], completionHandler)
        }

        /// Retrieves the syncing status
        public func syncStatus(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/status/sync", [:], completionHandler)
        }

        /// Retrieves the configuration
        public func autoconfigure(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/autoconfigure", [:], completionHandler)
        }
    }
}
