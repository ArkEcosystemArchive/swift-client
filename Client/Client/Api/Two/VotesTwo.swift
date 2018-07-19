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
    class Votes {

        private let client: ArkClient
        private let apiGetHandler: ApiGetHandler
        private var endpoint: String {
            return "\(client.host)/votes"
        }

        public init(client: ArkClient, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiGetHandler = apiGetHandler
        }

        /// Retrieves a vote
        public func get(id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
        }

        /// Retrieves all votes
        public func all(limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiGetHandler(endpoint, ["limit": limit, "page": page], completionHandler)
        }
    }
}
