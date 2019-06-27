//
//  UICollectionView+Extensions.swift
//  
//
//  Created by Sasha Prokhorenko on 27.06.19.
//

import UIKit

public extension UICollectionView {
    /// Register UICollectionViewCell with UINib
    ///
    /// ```
    /// collectionView.register(cellType: MyCell.self)
    /// ```
    func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    /// Register UICollectionViewCell
    ///
    /// ```
    /// collectionView.register(cellTypes: [MyCell1.self, MyCell2.self])
    /// ```
    func register<T: UICollectionViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register(cellType: $0, bundle: bundle) }
    }
    
    /// Register UICollectionReusableView with UINib
    ///
    /// ```
    /// collectionView.register(reusableViewType: MyReusableView.self)
    /// ```
    func register<T: UICollectionReusableView>(reusableViewType: T.Type,
                                                      ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                                      bundle: Bundle? = nil) {
        let className = reusableViewType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    /// Register UICollectionReusableView
    ///
    /// ```
    /// collectionView.register(reusableViewTypes: [MyReusableView1.self, MyReusableView2.self])
    /// ```
    func register<T: UICollectionReusableView>(reusableViewTypes: [T.Type],
                                               ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                                      bundle: Bundle? = nil) {
        reusableViewTypes.forEach { register(reusableViewType: $0, ofKind: kind, bundle: bundle) }
    }
    
    /// Dequeue UICollectionViewCell
    ///
    /// ```
    /// let cell = collectionView.dequeueReusableCell(with: MyCell.self, for: indexPath)
    /// ```
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type,
                                                             for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    /// Dequeue UICollectionReusableView
    ///
    /// ```
    /// let view = collectionView.dequeueReusableView(with: MyReusableView.self, for: indexPath)
    /// ```
    func dequeueReusableView<T: UICollectionReusableView>(with type: T.Type,
                                                                 for indexPath: IndexPath,
                                                                 ofKind kind: String = UICollectionView.elementKindSectionHeader) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
