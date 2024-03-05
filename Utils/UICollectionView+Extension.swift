//
//  UICollectionView+Extension.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 05/03/24.
//  Copyright © 2024 Laryssa Castagnoli. All rights reserved.
//

import UIKit
import Foundation

extension UICollectionView {

    public func register<Element: UICollectionViewCell>(cell: Element.Type) {
        
        register(cell.nib, forCellWithReuseIdentifier: cell.reuseIdentifier)
    }

    public func dequeue<Element: UICollectionViewCell>(_ cell: Element.Type, at indexPath: IndexPath) -> Element {

        dequeueReusableCell(withReuseIdentifier: cell.reuseIdentifier, for: indexPath) as! Element
    }
}

extension Collection {
    
    public subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

extension UICollectionReusableView {

    public class var reuseIdentifier: String { String(describing: self) }
    class var nib: UINib { UINib(nibName: reuseIdentifier, bundle: Bundle(for: self)) }
}
