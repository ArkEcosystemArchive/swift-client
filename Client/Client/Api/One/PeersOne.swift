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
    class Peers {
        
        private let client: ArkClient
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            get {
                return "\(client.host)/peers"
            }
        }
        
        public init(client: ArkClient, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiHandler = apiHandler
        }
        
        /// Retrieves a peer
        public func get(ip: String, port: Int, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/get", ["ip": ip, "port": port], completionHandler)
        }
        
        /// Retrieves all peers, based on the given filter parameter(s)
        public func all(parameters: [String: Any]? = nil, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler(endpoint, parameters, completionHandler)
        }
        
        /// Retrieves the core version
        public func version(completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
            apiHandler("\(endpoint)/version", [:], completionHandler)
        }
    }
}

