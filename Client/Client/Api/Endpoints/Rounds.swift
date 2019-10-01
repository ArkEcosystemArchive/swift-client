// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

public class Rounds {

    private let connection: Connection
    private let apiGetHandler: ApiGetHandler
    private let apiPostHandler: ApiPostHandler
    private var endpoint: String {
        return "\(connection.host)/rounds"
    }

    public init(connection: Connection, _ apiGetHandler: @escaping ApiGetHandler = handleApiGet, _ apiPostHandler: @escaping ApiPostHandler = handleApiPost) {
        self.connection = connection
        self.apiGetHandler = apiGetHandler
        self.apiPostHandler = apiPostHandler
    }

    /// Retrieves the forging delegates for a given round
    public func delegates(id: Int, completionHandler: @escaping ([String: Any]?) -> Void) {
        apiGetHandler("\(endpoint)/\(id)/delegates", [:], completionHandler)
    }
}
