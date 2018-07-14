//
//  PersonalInformationModel.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/14.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class PersonalInformationModel: NSObject {

    var type:Int?//type=0,名字； type=1,ID； type=2,积分
    var typeStr:String?
    var name:String?
    
    var userID:String?
    var score:String?
    var avatarImg:String?
    
    class func setupModel(_ typeStr:String?, type:Int?, name:String?, userID:String?, score:String?, avatarImg:String?) -> PersonalInformationModel {
        
        let model = PersonalInformationModel()
        model.typeStr = typeStr
        model.type = type
        model.name = name
        
        model.userID = userID
        model.score = score
        model.avatarImg = avatarImg
        return model
    }

}
