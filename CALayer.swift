//
//  CALayer.swift
//  HiLuck
//
//  Created by hu on 2018/1/31.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension CAShapeLayer {
    /// 创建一条线
    class func creatLine(color: UIColor, start: CGPoint, end: CGPoint) -> CAShapeLayer{
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        let line = CAShapeLayer()
        line.strokeColor = K_BlackDC.cgColor
        line.path = path.cgPath
        return line
    }
}
