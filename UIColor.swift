//
//  UIColor.swift
//  HiLuck
//
//  Created by hu on 2018/1/17.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension UIColor {
    /// 创建渐变 layer
    class func changeArray(bounds:CGRect, array:[UIColor], radius: CGFloat = 0) -> CAGradientLayer {
        let newArray = array.map { return $0.cgColor }

        //创建并实例化CAGradientLayer
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = newArray
        //(这里的起始和终止位置就是按照坐标系,四个角分别是左上(0,0),左下(0,1),右上(1,0),右下(1,1))
        //渲染的起始位置
        gradientLayer.startPoint = CGPoint.zero
        //渲染的终止位置
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        //设置frame和插入view的layer
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = radius
        return gradientLayer
        
    }
    /// 由 String 转化成 UIColor: "#01ff23" -> UIColor
    convenience init(hexString:String){
        //处理数值
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = cString.count
        //错误处理
        if length != 7 || !cString.hasPrefix("#") {
            //返回 黑色
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            return
        }
        //截取 # 之后的内容
        let index = cString.index(cString.startIndex, offsetBy: 1)
        cString = String(cString[index...])
        //字符串截取
        let redRan = cString.index(cString.startIndex, offsetBy: 2)
        let red = String(cString[cString.startIndex..<redRan])
        let greenRan = cString.index(redRan, offsetBy: 2)
        let green = String(cString[redRan..<greenRan])
        let blueRan = cString.index(greenRan, offsetBy: 2)
        let blue = String(cString[greenRan..<blueRan])
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: red).scanHexInt32(&r)
        Scanner(string: green).scanHexInt32(&g)
        Scanner(string: blue).scanHexInt32(&b)
        //根据颜色值创建UIColor
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
}
