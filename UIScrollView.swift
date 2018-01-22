//
//  UIScrollView.swift
//  HiLuck
//
//  Created by hu on 2018/1/22.
//  Copyright © 2018年 Hyuge. All rights reserved.
//

import UIKit

extension UIScrollView {
    func setupDefault() {
        self.isPagingEnabled = true
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = true
    }
}
