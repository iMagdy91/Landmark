//
//  LMMappingManager.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/25/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import Foundation

class LMMappingManager {
    
    private static var converstionTable: [Conversion]?
    
    
    /**
     Map LMProductModel to LMProductViewModel.
     
     - Parameter productModel: LMProductModel to be mapped.
     - Returns : Mapped LMProductViewModel array.
     
     */
    class func mapProductModelToProductViewModel(productModel: LMProductModel?) -> [LMProductViewModel] {
        
        var products        : [LMProductViewModel]  = [LMProductViewModel]()
        converstionTable                            = productModel?.conversion
        
        if let productArray = productModel?.products {
            
            for product in productArray {
                
                let priceInCurrentCurrency  : String?               = mapProduct(product: product, fromCurrency: product.currency, toCurrency: LMProductsStore.defaultCurrency)
                let productViewModel        : LMProductViewModel    = LMProductViewModel.init(name: product.name, price: priceInCurrentCurrency, url: product.url, currency: LMProductsStore.defaultCurrency)
                products.append(productViewModel)
            }
        }
        
        return products
    }
    
    /**
     Map Product price to the required currency.
     
     - Parameter product: Product to be mapped.
     - Parameter fromCurrency: Currency to convert from.
     - Parameter toCurrency: Currency to convert to.
     - Returns : Converted value.
     
     */
    class func mapProduct(product: Product?,
                          fromCurrency currencyFrom: Currency?,
                          toCurrency currencyTo: Currency) -> String? {
        if let converstionTable = converstionTable {
            let converstionRate: String? = converstionTable.filter{$0.from == currencyFrom && $0.to == currencyTo}.first?.rate
            
            if let rate = converstionRate {
                if let rateDoubleValue = Double(rate) {
                    if let price = product?.price {
                        if let priceDouble = Double(price) {
                            let priceAfterConversion = priceDouble * rateDoubleValue
                            return String(priceAfterConversion)
                        }
                    }
                }
            }

        }
        return nil
    }
}
