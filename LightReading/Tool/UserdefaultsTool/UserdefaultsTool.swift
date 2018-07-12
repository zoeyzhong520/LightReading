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
    class func setToken() {
        let defaults = UserDefaults.standard
        let UDID = UIDevice.current.identifierForVendor
        defaults.set(UDID, forKey: "token")
        defaults.synchronize()
    }
    
    ///get token
    class func getToken() -> String {
        let defaults = UserDefaults.standard
        guard let token = defaults.object(forKey: "token") as? String else { return "" }
        return token
    }
    
    
}
