//
//  ColorCell.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 05/03/24.
//  Copyright © 2024 Laryssa Castagnoli. All rights reserved.
//

import UIKit

final class ColorCell: UICollectionViewCell {

    // MARK: Cleanup
    override func prepareForReuse() {
        super.prepareForReuse()
        
        backgroundColor = .clear
    }
    
    // MARK: Methods
    func setup(with color: UIColor?) {
        
        prepareForReuse()
        backgroundColor = color
    }
}
