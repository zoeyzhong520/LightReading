//
//  UIViewController+Extension.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UIViewController {
    
    enum BarButtonItemPosition: Int {
        case left = 0
        case right = 1
    }
    
    ///设置导航栏Item
    func addBarButtonItemWithTitle(_ position:BarButtonItemPosition, title:String?, action:Selector?) {
        
        let barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        if position == .left {
            self.navigationItem.leftBarButtonItem = barButtonItem
        } else if position == .right {
            self.navigationItem.rightBarButtonItem = barButtonItem
        }
    }
    
    ///设置导航栏Item
    func addBarButtonItemWithImage(_ position:BarButtonItemPosition, image:String, action:Selector?) {
        
        let barButtonItem = UIBarButtonItem(image: UIImage.init(named: image), style: .plain, target: self, action: action)
        if position == .left {
            self.navigationItem.leftBarButtonItem = barButtonItem
        } else if position == .right {
            self.navigationItem.rightBarButtonItem = barButtonItem
        }
    }
}
















