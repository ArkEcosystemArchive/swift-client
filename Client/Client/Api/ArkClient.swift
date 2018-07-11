//
//  ArkClient.swift
//  Client
//
//  Created by ItsANameToo on 10-07-18.
//  Copyright © 2018 ARK Ecosystem. All rights reserved.
//

import Foundation

class ArkClient {
    
    let host: String
    let version: Int
    
    init(host: String, version: Int) {
        self.host = host
        self.version = version
    }
}
