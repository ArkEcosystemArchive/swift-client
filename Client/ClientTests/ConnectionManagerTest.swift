//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation
import XCTest
@testable import Client

class ConnectionmanagerTest: XCTestCase {

    private var manager: ConnectionManager?
    private let mainHost = "https://127.0.0.1:4003/api"
    private let devHost = "https://0.0.0.0:4003/api"

    override func setUp() {
        super.setUp()
        manager = ConnectionManager()
    }

    func testConnectDisconnect() {
        let mainConn = Connection(host: mainHost)
        let devConn = Connection(host: devHost)
        manager?.connect(to: mainConn, withName: "main")
        XCTAssertEqual(manager?.getConnections().count, 1)

        manager?.connect(to: devConn, withName: "dev")
        XCTAssertEqual(manager?.getConnections().count, 2)

        manager?.connect(to: mainConn, withName: "main")
        XCTAssertEqual(manager?.getConnections().count, 2)

        XCTAssertNoThrow(try manager?.disconnect(from: "dev"))
        XCTAssertEqual(manager?.getConnections().count, 1)

        XCTAssertThrowsError(try manager?.disconnect(from: "dev"))
    }

    func testConnection() {
        let mainConn = Connection(host: mainHost)
        manager?.connect(to: mainConn, withName: "main")
        XCTAssertNoThrow(try manager?.connection())
        XCTAssertNoThrow(try manager?.connection("main"))
        XCTAssertThrowsError(try manager?.connection("dev"))
    }

    func testDefaultConnection() {
        XCTAssertEqual(manager?.getDefaultConnection(), "main")
        manager?.setDefaultConnection(name: "dev")
        XCTAssertEqual(manager?.getDefaultConnection(), "dev")
    }

}
