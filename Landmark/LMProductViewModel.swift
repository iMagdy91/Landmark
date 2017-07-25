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
    private(set) var price      :String?
    private(set) var url        :String?
    private(set) var currency   :Currency?
    
    // MARK: - Init
    required init(name: String?,
                  price: String?,
                  url: String?,
                  currency: Currency?) {
        self.name       = name
        self.price      = price
        self.url        = url
        self.currency   = currency
    }
    
    
    
}
