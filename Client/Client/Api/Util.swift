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

/// Utility function to properly handle the different API calls
///
/// - Parameters:
///   - url: the url to which the request is made
///   - parameters: a dictionary of additional parameters that are send along with the request
///   - completionHandler: function to handle the response
func handleApiCall(_ url: String, _ parameters: [String: Any]?, completionHandler: @escaping (Dictionary<String, Any>?) -> Void) {
    Alamofire.request(url, parameters: parameters).responseJSON { response in
        print(response)
        if let json = response.result.value {
            completionHandler(json as? Dictionary<String, Any>)
        } else {
            completionHandler(nil)
        }
    }
}
