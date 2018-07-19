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
    class Signatures {

        private let client: ArkClient
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            return "\(client.host)/signatures"
        }

        public init(client: ArkClient, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiHandler = apiHandler
        }

        /// Retrieves the fee for a second signature
        public func fee(completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/fee", [:], completionHandler)
        }
    }
}
