//
//  LMNetworkManager.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/23/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkSuccessClosure     = (Any?) -> Void
typealias NetworkErrorClosure       = (Error) -> Void

class LMNetworkManager {
    
    /**
     Requests data from API and get the response back.
     
     - Parameter path: API path.
     - Parameter requestMethod: request method .GET .POST etc..
     - Parameter parameters: request parameters.
     - Parameter headers: request headers.
     - Parameter success: response success block.
     - Parameter failure: response failure block.
     */
    
    class func performRequestWithPath(path: String?,
                                      requestMethod: Alamofire.HTTPMethod,
                                      parameters: [String : Any]?,
                                      headers: [String : String]?,
                                      success:@escaping NetworkSuccessClosure,
                                      failure:  @escaping NetworkErrorClosure) {
        
        let url = (path != nil) ? Network.baseURL + path! : Network.baseURL
        Alamofire.request(url, method: requestMethod, parameters: parameters, headers: headers)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                    
                case .success(_):
                    success(response.result.value)
                case .failure(let error):
                    failure(error)
                }
        }
    }

    
}
