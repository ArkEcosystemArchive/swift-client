//
// This file is part of Ark Swift Client.
//
// (c) Ark Ecosystem <info@ark.io>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.
//

import Alamofire
import Foundation

class Accounts {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/accounts"
        }
    }
    
    init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves the given address
    func get(address: String, completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint, parameters: ["address": address]).responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieve the balance of the given address
    func balance(of address: String, completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getBalance", parameters: ["address": address]).responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the publicKey of the address
    func publicKey(of address: String, completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getPublicKey", parameters: ["address": address]).responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the delegate that the given address voted for
    func delegate(votedBy address: String, completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/delegates", parameters: ["address": address]).responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the current delegate registration fee
    func delegateFee(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/delegates/fee").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the top accounts
    func top(limit: Int = 20, offset: Int = 0, completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/top", parameters: ["limit": limit, "offset": offset]).responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves a list of all accounts
    func all(limit: Int = 20, offset: Int = 0, completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getAllAccounts", parameters: ["limit": limit, "offset": offset]).responseJSON { response in
                completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the number of accounts
    func count(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/count").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }    
}
