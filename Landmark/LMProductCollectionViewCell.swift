//
//  LMProductCollectionViewCell.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/25/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit
import Kingfisher

class LMProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var productImageView     : UIImageView!
    @IBOutlet weak var productNameLabel     : UILabel!
    @IBOutlet weak var productCurrencyLabel : UILabel!
    
    // MARK: - Cell Customization
    func customizeCellWithModel(product: LMProductViewModel?) {
        if let imageURL = product?.url {
            productImageView.kf.setImage(with: URL(string: imageURL))
        }
        productNameLabel.text = product?.name
        if let currency = product?.currency, let price = product?.price {
            productCurrencyLabel.text = currency.description().symbol + " " + price.twoDecimalNumbers
        }
    }
    
}
