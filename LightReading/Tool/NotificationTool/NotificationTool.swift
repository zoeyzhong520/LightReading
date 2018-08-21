//
//  NotificationTool.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/21.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: NotificationTool

class NotificationTool: NSObject {

    ///注册通知
    class func registerNotificationCenter(_ observer:Any, selector:Selector, name:NSNotification.Name, object:Any?) {
        NotificationCenter.default.addObserver(observer, selector: selector, name: name, object: object)
    }
    
    ///销毁通知
    class func removeNotificationCenter(_ observer:Any) {
        NotificationCenter.default.removeObserver(observer)
    }
    
    ///监听程序即将结束
    class func registerApplicationWillTerminate(_ observer:Any, selector:Selector, object:Any?) {
        NotificationTool.registerNotificationCenter(observer, selector: selector, name: NSNotification.Name.UIApplicationWillTerminate, object: object)
    }
}

















