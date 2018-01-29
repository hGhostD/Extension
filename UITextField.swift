//
//  UITextField.swift
//  HiLuck
//
//  Created by hu on 2018/1/18.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension UITextField {
    /// 统一 UI 风格
    func setupWhitUI() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = K_Translucence
        self.textColor = .white
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedStringKey.foregroundColor: K_Placeholder])
    }
    /// 设置左侧偏移量
    func setupLeftSpace(_ value: CGFloat) {
        self.leftViewMode = .always
        let view = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.height))
        self.leftView = view
    }
    /// 设置灰色风格
    func setupGrayStyle() {
        self.layer.cornerRadius = 10
        self.backgroundColor = K_BlackF5
        self.textColor = .black
    }
    
}
