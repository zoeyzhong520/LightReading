//
//  MainTabBarTool.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class MainTabBarTool: NSObject {

    ///创建UINavigationController
    class func createViewController(_ vc:UIViewController, title:String?, image:String, selectedImage:String) -> UINavigationController {
        
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: image)
        vc.tabBarItem.selectedImage = UIImage.init(named: selectedImage)
        let navVC = UINavigationController.init(rootViewController: vc)
        return navVC
    }
}
