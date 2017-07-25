//
//  LMProductViewController.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/25/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit

let numberOfItemsInRow                  : Double = 2.0

class LMProductViewController: LMBaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var collectionView   : UICollectionView!
    @IBOutlet weak var pageControl      : UIPageControl!
    
    // MARK: - Properties
    private     let productStore        :LMProductsStore = LMProductsStore()
    internal    var products            :[LMProductViewModel]? {
        didSet {
            
            pageControl.numberOfPages = Int(ceil(Double((products?.count ?? 0)) / numberOfItemsInRow))
            collectionView.reloadData()
        }
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchProducts()
    }

    // MARK: - Private Methods
    private func fetchProducts() {
        
        productStore.getProducts(success: { [weak self](products) in
            guard let strongSelf = self else { return }
            strongSelf.products = products as? [LMProductViewModel]
        }) { [weak self](error) in
            guard let strongSelf = self else { return }
            strongSelf.handleError(error: error)
        }
    }
    
    // MARK: - Actions
    @IBAction func segmentControlValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            LMProductsStore.defaultCurrency = .inr
            break
        case 1:
            LMProductsStore.defaultCurrency = .aed
            break
        case 2:
            LMProductsStore.defaultCurrency = .sar
            break
        default:
            break
        }
        LMMappingManager.mapProductViewModel(productsViewModel: &products, toCurrency: LMProductsStore.defaultCurrency)
        collectionView.reloadData()
    }
    

  

}
