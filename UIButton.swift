//
//  UIButton.swift
//  HiLuck
//
//  Created by hu on 2018/1/17.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension UIButton {
    /// 设置按钮图标 自定义 bounds
    func setImageWithBounds(bounds: CGRect, image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        self.addSubview(imageView)
    }
    /// 设置白色 按钮
    func setupWhiteStyle() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = K_Translucence
        self.titleLabel?.textColor = .white
    }
}
