//
//  UIViewController+Extension.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UIViewController {
    
    enum BarButtonItemPosition: Int {
        case left = 0
        case right = 1
    }
    
    ///设置导航栏Item
    func addBarButtonItemWithTitle(_ position:BarButtonItemPosition, title:String?=nil, action:Selector?) {
        
        let barButtonItem = UIBarButtonItem(title: title, style: .plain, target: self, action: action)
        if position == .left {
            self.navigationItem.leftBarButtonItem = barButtonItem
        } else if position == .right {
            self.navigationItem.rightBarButtonItem = barButtonItem
        }
    }
    
    ///设置导航栏Item
    func addBarButtonItemWithImage(_ position:BarButtonItemPosition, image:String, action:Selector?) {
        
        let barButtonItem = UIBarButtonItem(image: UIImage.init(named: image), style: .plain, target: self, action: action)
        if position == .left {
            self.navigationItem.leftBarButtonItem = barButtonItem
        } else if position == .right {
            self.navigationItem.rightBarButtonItem = barButtonItem
        }
    }
    
    ///跳转到下一个页面
    func showViewController(_ vcName:String, hidesBottomBarWhenPushed:Bool=false) {
        if let vc = NSClassFromString("LightReading.\(vcName)") as? UIViewController.Type {
            let tmpVC = vc.init()
            tmpVC.hidesBottomBarWhenPushed = hidesBottomBarWhenPushed
            self.navigationController?.pushViewController(tmpVC, animated: true)
        }
    }
    
    ///跳转至登录页
    func showLoginViewController(showAlert:Bool=false) {
        
        if showAlert {
            let alert = UIAlertController.init(title: "提示", message: "您确定要退出登录吗？", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { (action) in
                if let vc = NSClassFromString("LightReading.LoginViewController") as? UIViewController.Type {
                    UserdefaultsTool.setToken("")//清空token
                    self.present(vc.init(), animated: true, completion: nil)
                }
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            if let vc = NSClassFromString("LightReading.LoginViewController") as? UIViewController.Type {
                UserdefaultsTool.setToken("")//清空token
                self.present(vc.init(), animated: true, completion: nil)
            }
        }
    }
    
    ///跳转到LRWebViewController
    func showLRWebViewController(_ url:String?) {
        let vc = LRWebViewController()
        vc.url = url
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
















