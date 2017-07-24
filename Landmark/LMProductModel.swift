//
//  LMProductModel.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/24/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

// DTO Class to parse content of API into.
class LMProductModel: Mappable {
    
    // MARK: - Properties
    private(set) var conversion: [Conversion]?
    private(set) var title     : String?
    private(set) var products  : [Product]?
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    /**
     Mapping from API
     */
    func mapping(map: Map) {
        conversion <- map["conversion"]
        title      <- map["title"]
        products   <- map["products"]
        
    }
    
}

class Conversion: Mappable {
    
    // MARK: - Properties
    
    
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    /**
     Mapping from API
     */
    func mapping(map: Map) {

    }
    
}

class Product: Mappable {
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    /**
     Mapping from API
     */
    func mapping(map: Map) {
        
    }
}
