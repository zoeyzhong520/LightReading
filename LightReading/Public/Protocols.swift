//
//  Protocols.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/19.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

protocol TopTitleScrollBarDelegate: NSObjectProtocol {
    func didClickTitle(_ index:Int)
}

@objc protocol TopTitleMainViewDelegate: NSObjectProtocol {
    ///返回标题数组
    func titlesForTopTitleView() -> [String]?
    
    ///返回控制器数组
    func viewControllersForTopTitleView() -> [UIViewController]?
}





























