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
    class Transactions {

        private let client: ArkClient
        private let apiHandler: ApiGetHandler
        private var endpoint: String {
            return "\(client.host)/transactions"
        }

        public init(client: ArkClient, _ apiHandler: @escaping ApiGetHandler = handleApiGet) {
            self.client = client
            self.apiHandler = apiHandler
        }

        /// Retrieves a transaction
        public func get(id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/get", ["id": id], completionHandler)
        }

        /// Retrieves all transactions, based on the given filter parameter(s)
        public func all(parameters: [String: Any]? = nil, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler(endpoint, parameters, completionHandler)
        }

        /// Retrieves an unconfirmed transaction
        public func getUnconfirmed(id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/unconfirmed/get", ["id": id], completionHandler)
        }

        /// Retrieves all unconfirmed transactions, based on the given filter parameter(s)
        public func allUnconfirmed(parameters: [String: Any]? = nil, completionHandler: @escaping ([String: Any]?) -> Void) {
            apiHandler("\(endpoint)/unconfirmed", parameters, completionHandler)
        }
    }
}
