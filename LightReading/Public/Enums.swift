//
//  Enums.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/13.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class Enums: NSObject {

    //用户数据部分,下载书籍,个人收藏,阅读痕迹,积分商城,个人设置
    enum MineCellType:Int {
        case UserInfoType = 0
        case DownloadBookType
        case CollectionType
        case ReadingTraceType
        case PointsMallType
        case SettingType
    }
    
    enum PersonalInformationCellType:Int {
        case AvatarType = 0
        case NameType
        case UserIDType
        case ScoreType
    }
    
    enum SettingCellType:Int {
        case AboutUsType = 0
        case SignOut
    }
    
    enum BookDetailCellType:Int {
        case Collect = 0
        case Download
        case StartReading
        case TableOfContents
        case Comment
    }
}






