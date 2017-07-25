//
//  LMProductViewModel.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/25/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation


class LMProductViewModel: LMBaseViewModel {
    
    // MARK: - Properties
    private(set) var name       :String?
    var price                   :Double?
    private(set) var url        :String?
    var currency                :Currency?
    
    // MARK: - Init
    required init(name: String?,
                  price: Double?,
                  url: String?,
                  currency: Currency?) {
        self.name       = name
        self.price      = price
        self.url        = url
        self.currency   = currency
    }
    
    
    
}
