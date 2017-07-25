//
//  LMProductViewController+UICollectionView.swift
//  Landmark
//
//  Created by Mohamed Magdy on 7/25/17.
//  Copyright © 2017 Mohamed Magdy. All rights reserved.
//

import UIKit


extension LMProductViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    
    
    // MARK: - UICollectionViewDelegateFlowLayout Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width/CGFloat(numberOfItemsInRow), height: collectionView.bounds.size.height)
    }
   
    // MARK: - UICollectionViewDataSource Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: LMProductCollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier.productCellIdentifier, for: indexPath) as? LMProductCollectionViewCell
        cell?.customizeCellWithModel(product: products?[indexPath.row])
        
        return cell!
    }
    // MARK: - UIScrollViewDelegate Methods
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex: CGFloat = ceil(collectionView.contentOffset.x / collectionView.frame.size.width)
        pageControl.currentPage = Int(currentIndex)
        
        let index = scrollView.contentOffset.x / (collectionView.bounds.size.width/2)
        let fracPart = index.truncatingRemainder(dividingBy: 1)
        let item = Int(fracPart >= 0.5 ? ceil(index) : floor(index))
        
        let indexPath = IndexPath(item: item, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .left, animated: true)
    }
    
}
