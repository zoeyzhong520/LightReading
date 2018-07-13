//
//  UILabel+Extension.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UILabel {
    
    ///init label
    convenience init(_ text:String?=nil, font:UIFont?=nil, textColor:UIColor?=nil, alignment:NSTextAlignment?=nil) {
        
        self.init()
        self.text = text
        
        if let font = font {
            self.font = font
        }
        
        if let textColor = textColor {
            self.textColor = textColor
        }
        
        if let alignMent = alignment {
            self.textAlignment = alignMent
        }
    }
}














