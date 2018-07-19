//
//  UIScrollView+Extension.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/19.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    ///修复iOS11 UIScrollView顶部偏移
    func fixTopOffset() {
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = .never
        }
    }
}
