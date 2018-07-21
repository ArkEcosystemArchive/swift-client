// 
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Foundation

class ConnectionManager {

    private var connections: [String: Connection]
    private var defaultConnection = "main"

    public init() {
        connections = [String: Connection]()
    }

    // Connect to the given connection
    // Note that any previous connection with the same name will be overwritten
    public func connect(to conn: Connection, withName name: String) {
        connections[name] = conn
    }

    // Disconnect from the given connection
    public func disconnect(from name: String) throws {
        let conn = connections.removeValue(forKey: name)
        if conn == nil {
            throw ArkError.unknownConnection
        }
    }

    // Get a connection instance
    public func connection(_ name: String? = nil) throws -> Connection {
        if let connectionName = name {
            return try self.retrieveConnection(connectionName)
        }
        return try self.retrieveConnection(self.getDefaultConnection())
    }

    // Helper function to retrieve a connection or throw an error if it doesn't exist
    private func retrieveConnection(_ name: String) throws -> Connection {
        if let conn = self.connections[name] {
            return conn
        }
        throw ArkError.unknownConnection
    }

    // Get the default connection name
    public func getDefaultConnection() -> String {
        return self.defaultConnection
    }

    // Set a default connection name
    public func setDefaultConnection(name: String) {
        self.defaultConnection = name
    }

    // Get all created connections
    public func getConnections() -> [String: Connection] {
        return self.connections
    }

}
