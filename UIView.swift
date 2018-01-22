//
//  UIView.swift
//  HiLuck
//
//  Created by hu on 2018/1/17.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension UIView {
    var width: CGFloat { return self.frame.size.width }
    var height: CGFloat { return self.frame.size.height }
    /// 设置 UIView 阴影和圆角
    func setShadow(_ color: UIColor = K_Shadow, _ cornerRadius: CGFloat = 10) {
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = cornerRadius
    }
    /// 设置渐变颜色 从上至下渐变
    func setChangeColor(_ colorArr: [UIColor] = [K_BlueColor, K_BlueLight], radius: CGFloat = 0) {
        let layer = UIColor.changeArray(bounds: self.bounds, array: colorArr, radius: radius)
        self.layer.addSublayer(layer)
    }
}
