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

class Blocks {
    
    let client: ArkClient
    private var endpoint: String {
        get {
            return client.host + "/blocks"
        }
    }
    
    init(client: ArkClient) {
        self.client = client
    }
    
    /// Retrieves the given block
    func get(id: String, completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/get", parameters: ["id": id]).responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves all blocks, based on the given filter parameter(s)
    func all(parameters: [String: String], completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint, parameters: parameters).responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the blockchain epoch
    func epoch(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getEpoch").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the blockchain height
    func height(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getHeight").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the blockchain nethash
    func nethash(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getNethash").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the transaction fee
    func fee(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getFee").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the different network fees
    func fees(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getFees").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the blockchain milestone
    func milestone(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getMilestone").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the blockchain reward
    func reward(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getReward").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the blockchain supply
    func supply(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getSupply").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
    
    /// Retrieves the blockchain status
    func status(completionHandler: @escaping (Any) -> Void) {
        Alamofire.request(endpoint + "/getStatus").responseJSON { response in
            completionHandler(response.result.value!)
        }
    }
}
