//
//  Line.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 06/02/18.
//  Copyright © 2018 Laryssa Castagnoli. All rights reserved.
//

import Foundation
import UIKit

final class Line {

    public let start: CGPoint?
    public let end: CGPoint?
    public let color: UIColor?
    public let width: CGFloat?
    
    init(start: CGPoint?, end: CGPoint?, color: UIColor?, width: CGFloat?) {
        self.start = start
        self.end = end
        self.color = color
        self.width = width
    }
}
