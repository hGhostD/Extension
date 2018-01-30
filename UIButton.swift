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
        imageView.frame = bounds
//        imageView.center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
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
    /// 设置灰色 按钮
    func setupGrayStyle() {
        self.layer.cornerRadius = 10
        self.layer.borderColor = K_BlackF5.cgColor
        self.backgroundColor = K_BlackF5
        self.setTitleColor(.black, for: .normal)
    }
    /// 设置带图片和标题的按钮
    func setupImageAndTitle(image: UIImage, title: String, titleColor: UIColor = .black) {
        let width = self.width
        let imageWidth = width / 2 - 10
        let imageFrame = CGRect(x: width / 4 + 5, y: width / 6, width: imageWidth, height: imageWidth)
        
        self.setImageWithBounds(bounds: imageFrame, image: image)
        let labelFrame = CGRect(x: 0, y: imageFrame.maxY + 5, width: width, height: width / 3)
        let titleLabel = UILabel(frame: labelFrame)
        titleLabel.textColor = titleColor
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = HY_Font(12)
        self.addSubview(titleLabel)
    }
    /// 蓝色完成大按钮
    func createBlueBigButton(rect: CGRect, title: String) {
        self.bounds = rect
        self.setChangeColor(radius: 10)
        self.setShadow()
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.setTitleColor(.white, for: .normal)
    }
}
