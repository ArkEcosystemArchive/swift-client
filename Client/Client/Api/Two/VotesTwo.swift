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
            get {
                return "\(client.host)/votes"
            }
        }
        
        public init(client: ArkClient, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiGetHandler = apiGetHandler
        }
        
        /// Retrieves a vote
        public func status(id: String, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
        }
        
        /// Retrieves all votes
        public func all(limit: Int = 20, page: Int = 1, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiGetHandler(endpoint, ["limit": limit, "page": page], completionHandler)
        }
    }
}
