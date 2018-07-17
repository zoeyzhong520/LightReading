//
//  SettingModel.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SettingModel: NSObject {

    @objc var titleText:String?
    @objc var type:String?//type=0 清除缓存；type=1 版本号；type=2 关于我们
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
