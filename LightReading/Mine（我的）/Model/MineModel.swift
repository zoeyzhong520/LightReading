//
//  MineModel.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class MineModel: NSObject {

    var name:String?
    var userID:String?
    var score:String?
    
    var avatarImg:String?
    
    class func setupModel(_ name:String?, userID:String?, score:String?, avatarImg:String?) -> MineModel {
        
        let model = MineModel()
        model.name = name
        model.userID = userID
        model.score = score
        
        model.avatarImg = avatarImg
        return model
    }
}
