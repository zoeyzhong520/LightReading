//
//  Constant.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit
import SnapKit

//MARK: 获取尺寸信息
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height
let StatusBarHeight = UIApplication.shared.statusBarFrame.height
let NavigationBarHeight:CGFloat = 44

//MARK: 获取设备类型
let IS_IPAD = UIUserInterfaceIdiom(rawValue: 0) == .pad
let IS_IPHONE = UIUserInterfaceIdiom(rawValue: 0) == .phone
let IS_RETINA = UIScreen.main.scale > 2.0

let SCREEN_MAX_LENGTH = max(ScreenWidth, ScreenHeight)
let SCREEN_MIN_LENGTH = min(ScreenWidth, ScreenHeight)

//机型判断
let iPhone4s = IS_IPHONE && SCREEN_MAX_LENGTH < 568.0
let iPhoneSE = IS_IPHONE && SCREEN_MAX_LENGTH == 568.0
let iPhone7 = IS_IPHONE && SCREEN_MAX_LENGTH == 667.0
let iPhone7P = IS_IPHONE && SCREEN_MAX_LENGTH == 736.0
let iPhoneX = IS_IPHONE && SCREEN_MAX_LENGTH == 812.0

let TabBarHeight:CGFloat = iPhoneX ? 83.0 : 49.0

//MARK: 颜色
let RGB:(CGFloat,CGFloat,CGFloat) -> UIColor = { (r,g,b) in
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
}

let RGBA:(CGFloat,CGFloat,CGFloat,CGFloat) -> UIColor = { (r,g,b,a) in
    return UIColor.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

let HexColor:(UInt32) -> UIColor = { hex in
    let r:CGFloat = CGFloat((hex & 0xFF000000) >> 24) / 255.0
    let g:CGFloat = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
    let b:CGFloat = CGFloat((hex & 0x0000FF00) >> 8) / 255.0
    let a:CGFloat = CGFloat(hex & 0x000000FF) / 255.0
    return UIColor.init(red: r, green: g, blue: b, alpha: a)
}

let BlackColor = RGB(51, 51, 51)
let LightGrayColor = UIColor.lightGray
let TableViewBackgroundColor = RGB(244, 244, 244)
let LineBackgroundColor = RGB(244, 244, 244)
let CommonBackgroundColor = RGB(244, 244, 244)
let BlueColor = RGB(0, 123, 250)
let MongolianlayerColor = RGBA(0, 0, 0, 0.2)

//MARK: 字体
// 自适应字体大小
let fontSizeScale:(CGFloat) -> CGFloat = { size in
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    return appDelegate.fontSizeScale(size)
}

//常用字体大小
let DRFont:(CGFloat) -> UIFont = { size in
    return UIFont.systemFont(ofSize: fontSizeScale(size))
}

//常用粗体大小
let DRBoldFont:(CGFloat) -> UIFont = { size in
    return UIFont.boldSystemFont(ofSize: fontSizeScale(size))
}

let FirstFont = DRFont(21)
let SecondFont = DRFont(20)
let ThirdFont = DRFont(18)
let FourthFont = DRFont(16)
let FifthFont = DRFont(15)
let SixthFont = DRFont(12)

//MARK: BmobAppKey
let BmopAppKey = "d793f992929b22717e258158f02f8ef1"

//MARK: AppDelegate
let appDelegate = UIApplication.shared.delegate as! AppDelegate

//MARK: 反馈信息
let LoginFailureStr = "登录失败"

//MARK: 定义数字和字母的宏
///定义数字和字母的宏
let ALPHANUM = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"














