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
    class Loader {
        
        private let client: ArkClient
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            get {
                return client.host + "/loader"
            }
        }
        
        public init(client: ArkClient, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiHandler = apiHandler
        }
        
        /// Retrieves the status
        public func status(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/status", [:], completionHandler)
        }
        
        /// Retrieves the syncing status
        public func syncStatus(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/status/sync", [:], completionHandler)
        }
        
        /// Retrieves the configuration
        public func autoconfigure(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint + "/autoconfigure", [:], completionHandler)
        }
    }
}
