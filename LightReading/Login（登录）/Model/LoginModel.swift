//
//  LoginModel.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class LoginModel: NSObject {

    var account:String!
    var password:String!
    
    ///setupModel
    class func setupModel(_ account:String, password:String) -> LoginModel {
        
        let model = LoginModel()
        model.account = account
        model.password = password
        return model
    }
}
