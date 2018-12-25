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

/// Set headers for the requests
let headers: HTTPHeaders = [
    "Content-Type": "application/json",
    "User-Agent": "ark-swift-client (https://github.com/ArkEcosystem/swift-client)",
    "API-Version": "2"
]
public typealias HTTPHeaders = [String: String]

/// ApiHandler aliases
public typealias ApiGetHandler = (String, [String: Any]?, @escaping ([String: Any]?) -> Void) -> Void
public typealias ApiPostHandler = (String, [String: Any]?, [String: Any]?, @escaping ([String: Any]?) -> Void) -> Void

/// Handles api get requests
///
/// - Parameters:
///   - url: the url to which the request is made
///   - parameters: a dictionary of additional parameters that are send along with the request
///   - completionHandler: function to handle the response
public func handleApiGet(_ url: String, _ parameters: [String: Any]?, completionHandler: @escaping ([String: Any]?) -> Void) {
    Alamofire.request(url, parameters: parameters, headers: headers).responseJSON { response in
        if let json = response.result.value {
            completionHandler(json as? [String: Any])
        } else {
            completionHandler(nil)
        }
    }
}

/// Handles api post requests
public func handleApiPost(_ url: String, _ parameters: [String: Any]?, _ body: [String: Any]?, completionHandler: @escaping ([String: Any]?) -> Void) {
    var urlComponents = URLComponents(string: url)!

    // Create our own url including the parameters
    if let params = parameters {
        var queryItems = [URLQueryItem]()
        for (key, value) in params {
            queryItems.append(URLQueryItem(name: key, value: String(describing: value)))
        }
        urlComponents.queryItems = queryItems
    }
    Alamofire.request(urlComponents, method: .post, parameters: body, encoding: JSONEncoding(options: []), headers: headers).responseJSON { (response) in
        if let json = response.result.value {
            completionHandler(json as? [String: Any])
        } else {
            completionHandler(nil)
        }
    }
}
