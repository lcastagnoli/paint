//
//  UIView+Extension.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 05/03/24.
//  Copyright © 2024 Laryssa Castagnoli. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func takeScreenshot() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
