//
//  UIImage.swift
//  HiLuck
//
//  Created by hu on 2018/1/30.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension UIImage {
    class func createWithColor(_ color: UIColor) -> UIImage {
        let rect = CGRect(0,0,1,1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
