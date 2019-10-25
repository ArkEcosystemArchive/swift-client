// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

public class Businesses {

    private let connection: Connection
    private let apiGetHandler: ApiGetHandler
    private let apiPostHandler: ApiPostHandler
    private var endpoint: String {
        return "\(connection.host)/businesses"
    }

    public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet, _ apiPostHandler: @escaping ApiPostHandler = handleApiPost) {
        self.connection = connection
        self.apiGetHandler = apiGetHandler
        self.apiPostHandler = apiPostHandler
    }

    /// Retrieves the given business
    public func get(id: Int, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/\(id)", [:], completionHandler)
    }

    /// Retrieves all businesses
    public func all(limit: Int = 100, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler(endpoint, ["limit": limit, "page": page], completionHandler)
    }

    /// Retrieves bridgechains for a given business
    public func bridgechains(ofBusiness id: Int, limit: Int = 100, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/\(id)/bridgechains", ["limit": limit, "page": page], completionHandler)
    }

    /// Searches for a business
    public func search(body: [String: Any]?, limit: Int = 100, page: Int = 1, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiPostHandler("\(endpoint)/search", ["limit": limit, "page": page], body, completionHandler)
    }
}
