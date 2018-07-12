//
//  UIButton+Extension.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UIButton {
    
    convenience init(_ title:String?, textColor:UIColor?, font:UIFont?, backgroundColor:UIColor?, makesToBounds:Bool?, cornerRadius:CGFloat?, borderWidth:CGFloat?, borderColor:UIColor?, target:Any?, action:Selector?) {
        
        self.init()
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
        self.setTitleColor(LightGrayColor, for: .highlighted)
        
        if let font = font {
            self.titleLabel?.font = font
        }
        
        self.backgroundColor = backgroundColor
        
        if let makesToBounds = makesToBounds {
            self.layer.masksToBounds = makesToBounds
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        
        if let borderWidth = borderWidth {
            self.layer.borderWidth = borderWidth
        }
        
        self.layer.borderColor = borderColor?.cgColor
        
        if let action = action {
            self.addTarget(target, action: action, for: .touchUpInside)
        }
    }
}










