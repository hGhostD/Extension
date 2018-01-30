//
//  String.swift
//  HiLuck
//
//  Created by hu on 2018/1/20.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension String {
    func mySubString(to index: Int) -> String {
        return String(self[..<self.index(self.startIndex, offsetBy: index)])
    }
    
    func mySubString(from index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)...])
    }
    
    //计算text高度
    func getTextHeigh(font:UIFont,width:CGFloat) -> CGFloat {
        let size = CGSize(width: width, height: 1000)
        let dic = [NSAttributedStringKey.font: font]
        let stringSize = self.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic, context:nil).size
        return stringSize.height
    }
}
