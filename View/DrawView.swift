//
//  DrawView.swift
//  Paint
//
//  Created by Laryssa Castagnoli on 06/02/18.
//  Copyright © 2018 Laryssa Castagnoli. All rights reserved.
//

import UIKit

final class DrawView: UIView {

    // MARK: Properties
    public var lines: [Line] = []
    public var lastPoint: CGPoint?
    public var color: UIColor?
    public var width: CGFloat?

    // MARK: Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastPoint = touches.first?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        let newPoint = touches.first?.location(in: self)
        let newLine = Line(start: lastPoint, end: newPoint, color: color, width: width)
        lines.append(newLine)
        lastPoint = newPoint
        self.setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {

        let context = UIGraphicsGetCurrentContext()
        context?.setLineCap(.round)
        for line in lines {

            context?.beginPath()
            context?.move(to: CGPoint(x: line.start?.x ?? .zero, y: line.start?.y ?? .zero))
            context?.addLine(to: CGPoint(x: line.end?.x ?? .zero, y: line.end?.y ?? .zero))
            context?.setStrokeColor(line.color?.cgColor ?? UIColor.black.cgColor)
            context?.setLineWidth(line.width ?? 1)
            context?.strokePath()
        }
    }
}
