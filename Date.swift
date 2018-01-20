//
//  Date.swift
//  HiLuck
//
//  Created by hu on 2018/1/20.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import Foundation

extension Date {
    /// 转换时间 yyyy/MM/dd
    func getString(_ fomat: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = fomat
        return formatter.string(from: self)
    }
}
