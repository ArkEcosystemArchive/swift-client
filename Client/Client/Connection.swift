//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

open class Connection {

    let host: String
    let version: Int

    public init(host: String, version: Int) {
        self.host = host
        self.version = version
    }
}
