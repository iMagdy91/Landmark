//
//  LMProductsStore.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/25/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

class LMProductsStore: LMBaseStoreProtocol {
    
    //Default Values
    static let defaultCurrency  :Currency = .inr
    
    
    /**
     Get products from API.
     
     - Parameter success: response success block with LMProductViewModel.
     - Parameter failure: response failure block with Error.
     */
     func getProducts(success: @escaping ViewModelClosure,
                     failure: @escaping ErrorClosure) {
        
        LMNetworkManager.performRequestWithPath(path: Network.path, requestMethod: .get, parameters: nil, headers: nil, success: { (response) in
            
            let products                : LMProductModel?       = Mapper<LMProductModel>().map(JSONObject: response)
            let productViewModelArray   : [LMProductViewModel]  = LMMappingManager.mapProductModelToProductViewModel(productModel: products)
            success(productViewModelArray)
            
        }, failure: failure)
        
    }
    
}
