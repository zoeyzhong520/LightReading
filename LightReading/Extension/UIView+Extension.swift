//
//  UIView+Extension.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UIView {
    
    convenience init(_ backgroundColor: UIColor?=nil) {
        self.init()
        
        self.backgroundColor = backgroundColor
    }
}
