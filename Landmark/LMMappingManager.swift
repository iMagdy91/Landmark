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
     
     - Parameter productModel   : LMProductModel to be mapped.
     - Returns                  : Mapped LMProductViewModel array.
     
     */
    class func mapProductModelToProductViewModel(productModel: LMProductModel?) -> [LMProductViewModel] {
        
        var products        : [LMProductViewModel]  = [LMProductViewModel]()
        converstionTable                            = productModel?.conversion
        converstionTable?.removeLast() //work around as the last conversion is not valid
        
        if let productArray = productModel?.products {
            
            for product in productArray {
                let priceDouble             : Double?                = Double(product.price ?? "")
                let priceInCurrentCurrency  : Double?               = mapProduct(price: priceDouble, fromCurrency: product.currency, toCurrency: LMProductsStore.defaultCurrency)
                let productViewModel        : LMProductViewModel    = LMProductViewModel.init(name: product.name, price: priceInCurrentCurrency, url: product.url, currency: LMProductsStore.defaultCurrency)
                products.append(productViewModel)
            }
        }
        
        return products
    }
    
    /**
     Map Product price to the required currency.
     
     - Parameter price          : Product price to be mapped.
     - Parameter fromCurrency   : Currency to convert from.
     - Parameter toCurrency     : Currency to convert to.
     - Returns                  : Converted value.
     
     */
    class func mapProduct(price: Double?,
                          fromCurrency currencyFrom: Currency?,
                          toCurrency currencyTo: Currency) -> Double? {
        if currencyFrom == currencyTo {
            return price
        }
        
        if let converstionTable = converstionTable {
            
            var converstionRate: String? = converstionTable.filter{$0.from == currencyFrom && $0.to == currencyTo}.first?.rate
            
            if converstionRate == nil {
                converstionRate = converstionTable.filter{$0.from == currencyTo && $0.to == currencyFrom}.first?.rate
                if let rate = converstionRate {
                    if let converstionRateDouble = Double(rate) {
                        converstionRate = String(1/converstionRateDouble)
                    }
                }
            }
            
            if let rate = converstionRate {
                if let rateDoubleValue = Double(rate) {
                    if let price = price {
                        let priceAfterConversion = price * rateDoubleValue
                        return priceAfterConversion
                    }
                }
            }
            

        }
        return nil
    }
    /**
     Map Product view model price to the required currency.
     
     - Parameter productsViewModel  : Products view model to be mapped.
     - Parameter toCurrency         : Currency to convert to.
     
     */
    class func mapProductViewModel(productsViewModel:inout [LMProductViewModel]?,
                                   toCurrency currencyTo: Currency) {
        
        if let products = productsViewModel {
            for productViewModel in products {
                productViewModel.price = mapProduct(price: productViewModel.price, fromCurrency: productViewModel.currency, toCurrency: currencyTo)
                productViewModel.currency = currencyTo

            }
        }
    }
}
