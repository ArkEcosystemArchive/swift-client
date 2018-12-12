//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

public class Transactions {

    private let connection: Connection
    private let apiGetHandler: ApiGetHandler
    private let apiPostHandler: ApiPostHandler
    private var endpoint: String {
        return "\(connection.host)/transactions"
    }

    public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet, _ apiPostHandler: @escaping ApiPostHandler = handleApiPost) {
        self.connection = connection
        self.apiGetHandler = apiGetHandler
        self.apiPostHandler = apiPostHandler
    }

    /// Creates the given transaction(s)
    public func create(body: [String: Any]?, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiPostHandler(endpoint, [:], body, completionHandler)
    }

    /// Retrieves the given transaction
    public func get(id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
    }

    /// Retrieves an unconfirmed transaction
    public func getUnconfirmed(id: String, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/unconfirmed/\(id)", [:], completionHandler)
    }

    /// Retrieves all transactions
    public func all(limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler(endpoint, ["limit": limit, "page": page], completionHandler)
    }

    /// Retrieves all unconfirmed transactions
    public func allUnconfirmed(limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/unconfirmed", ["limit": limit, "page": page], completionHandler)
    }

    /// Retrieves all transactions types
    public func types(completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/types", [:], completionHandler)
    }

    /// Searches for a transaction
    public func search(body: [String: Any]?, limit: Int = 20, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiPostHandler("\(endpoint)/search", ["limit": limit, "page": page], body, completionHandler)
    }
}
