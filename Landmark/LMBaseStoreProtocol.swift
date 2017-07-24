//
//  LMBaseStore.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/23/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation

protocol LMBaseStoreProtocol {
    
    typealias ErrorClosure      = (Error) -> Void
    typealias ViewModelClosure  = ([LMBaseViewModel]?) -> Void
    
    // MARK: - LMBaseStoreProtocol Methods
    func getProducts(success: @escaping ViewModelClosure,
                     failure: @escaping ErrorClosure)
    
}

