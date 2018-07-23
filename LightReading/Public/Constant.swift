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

//自定义颜色
let BlackColor = RGB(51, 51, 51)
let LightGrayColor = UIColor.lightGray
let TableViewBackgroundColor = RGB(244, 244, 244)
let LineBackgroundColor = RGB(244, 244, 244)
let CommonBackgroundColor = RGB(244, 244, 244)
let BlueColor = RGB(0, 123, 250)
let MongolianlayerColor = RGBA(0, 0, 0, 0.2)
let RandomColor = RGB(CGFloat(arc4random() % 255), CGFloat(arc4random() % 255), CGFloat(arc4random() % 255))

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

//自定义字体
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

//MARK: 默认占位图
let PlaceholderImage = UIImage.init(named: "placeholderImage")

//MARK: 链接🔗
//广告页链接
let FirstImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531500811341&di=f886574acab1a20b25f4e14d9b6f6c9e&imgtype=0&src=http%3A%2F%2Fpic31.photophoto.cn%2F20140625%2F0037037556931719_b.jpg"
let SecondImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531500811338&di=078e3fe3301f1780c826d4c46da4b34d&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fb90e7bec54e736d1a90c492590504fc2d5626984.jpg"
let ThirdImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531500811335&di=8b7354181c3d2ff1047607f7a6f3e81f&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F71cf3bc79f3df8dc8497d964c711728b46102898.jpg"
let FourthImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531500811332&di=5cbcde11465ad23c9f06809b9998b676&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2Fd31b0ef41bd5ad6ee440c21f8bcb39dbb7fd3c8d.jpg"

let FifthImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531501882361&di=060fea001ab2ceabc6c59e2cebe8669f&imgtype=0&src=http%3A%2F%2Fp1.wmpic.me%2Farticle%2F2016%2F11%2F21%2F1479696540_HzQvGxZF.jpg"
let SixthImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531501882350&di=165ea24efa60e8107c68a6a19842ec3a&imgtype=0&src=http%3A%2F%2Fwww.weimeifan.net%2Fwp-content%2Fuploads%2F2017%2F04%2F203cb085a5c2c3faf8e4f60131817256.jpg"
let SeventhImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531501882347&di=2600d4224421eb04878aa0ca977e8f5a&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F574e9258d109b3de3a992445c7bf6c81800a4cfd.jpg"
let EighthImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531501882346&di=43c8606ec25dd84f80ab3ed88c47fa00&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F0ff41bd5ad6eddc480f77ad632dbb6fd5266338f.jpg"
let NinethImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531501882346&di=6b056aed0df91331ed9647d4bdf4be20&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F13%2F59%2F99%2F88i58PICSPY_1024.jpg"
let TenthImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531502143066&di=7193db36685908177b3667081e45f7e9&imgtype=0&src=http%3A%2F%2Fi-4.yxdown.com%2F2018%2F1%2F10%2F6d185e5d-bfc4-49ee-8f0d-d843ae943a9c.jpg"

//用户头像链接
let AvatarImageUrl = "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1531504554793&di=512f9b3bbb48c5aa55bd2cd6d2203582&imgtype=0&src=http%3A%2F%2Fpic31.photophoto.cn%2F20140516%2F0010023335708279_b.jpg"

//MARK: 动画执行时长
let AnimateDuration:TimeInterval = 0.3

//MARK: key window
let LRKeyWindow = UIApplication.shared.keyWindow

//MARK: 获取App的build版本号
let AppBulidVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

//MARK: 通知名称
///ApplicationDidBecomeActive
let ApplicationDidBecomeActive = NSNotification.Name.UIApplicationDidBecomeActive

///ApplicationWillTerminate
let ApplicationWillTerminate = NSNotification.Name.UIApplicationWillTerminate

///ApplicationDidEnterBackground
let ApplicationDidEnterBackground = NSNotification.Name.UIApplicationDidEnterBackground

///HomeChildViewWillAppear_Notification
let HomeChildViewWillAppear_Notification = NSNotification.Name.init("HomeChildViewWillAppear_Notification")

///HomeChildViewWillDisappear_Notification
let HomeChildViewWillDisappear_Notification = NSNotification.Name.init("HomeChildViewWillDisappear_Notification")

///HomeChildViewAdvertisingClickBlock_Notification
let HomeChildViewAdvertisingClickBlock_Notification = NSNotification.Name.init("HomeChildViewAdvertisingClickBlock_Notification")

//MARK: BaiduLink
let BaiduLink = "https://www.baidu.com/"







