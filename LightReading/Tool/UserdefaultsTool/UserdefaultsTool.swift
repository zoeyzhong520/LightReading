//
//  UserdefaultsTool.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class UserdefaultsTool: NSObject {

    ///set token
    class func setToken(_ token:String) {
        let defaults = UserDefaults.standard
        defaults.set(token, forKey: "token")
        defaults.synchronize()
    }
    
    ///get token
    class func getToken() -> String {
        let defaults = UserDefaults.standard
        guard let token = defaults.object(forKey: "token") as? String else { return "" }
        return token
    }
    
    ///保存输入的评论
    class func saveInputComment(_ inputStr:String?, key:String) {
        let defaults = UserDefaults.standard
        defaults.set(inputStr, forKey: key)
        defaults.synchronize()
    }
    
    ///获取输入的评论
    class func getInputComment(_ key:String) -> String {
        let defaults = UserDefaults.standard
        if let inputComment = defaults.object(forKey: key) as? String {
            return inputComment
        } else {
            print("获取输入的评论失败！")
            return ""
        }
    }
    
    ///删除输入的评论
    class func deleteInputComment(_ key:String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}










