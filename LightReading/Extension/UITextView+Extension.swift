//
//  UITextView+Extension.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import Foundation

extension UITextView {
    
    convenience init(backgroundColor:UIColor?, font:UIFont?, textColor:UIColor?, isEditable:Bool?) {
        self.init()
        
        self.backgroundColor = backgroundColor
        self.font = font
        self.textColor = textColor
        
        if let isEditable = isEditable {
            self.isEditable = isEditable
        }
    }
    
    ///键盘上面添加view
    func setInputAccessoryView(_ target:Any?, action:Selector?) {
        let topView = UIToolbar.init(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 30))
        topView.barStyle = .black
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: action)
        topView.items = [doneButton]
        self.inputAccessoryView = topView
    }
}














