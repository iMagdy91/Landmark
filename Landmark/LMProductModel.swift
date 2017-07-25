//
//  LMProductModel.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/24/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation
import ObjectMapper

enum Currency: String {
    case inr = "INR"
    case aed = "AED"
    case sar = "SAR"
    
    func description() -> (currency:String, symbol:String) {
        switch self {
        case .inr:
            return ("INR", "₹")
        case .aed:
            return ("AED", "AED")
        case .sar:
            return ("SAR", "SAR")

        }
    }
}



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
        conversion  <- map["conversion"]
        title       <- map["title"]
        products    <- map["products"]
    }
    
}

class Conversion: Mappable {
    
    // MARK: - Properties
    private(set) var from      :Currency?
    private(set) var rate      :String?
    private(set) var to        :Currency?
    
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    /**
     Mapping from API
     */
    func mapping(map: Map) {
        from        <- map["from"]
        rate        <- map["rate"]
        to          <- map["to"]
    }
    
}

class Product: Mappable {
    
    // MARK: - Properties
    private(set) var currency   :Currency?
    private(set) var name       :String?
    private(set) var price      :String?
    private(set) var url        :String?
    
    // MARK: - Init
    required init?(map: Map) {
    }
    
    /**
     Mapping from API
     */
    func mapping(map: Map) {
        currency    <- map["currency"]
        name        <- map["name"]
        price       <- map["price"]
        url         <- map["url"]
    }
}
