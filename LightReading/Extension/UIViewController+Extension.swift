//
//  UIViewController+Extension.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit
import FolioReaderKit

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
    
    ///弹框（包含两个按钮）
    func alert(_ title:String?, msg:String?, buttonsArray:[String]?, confirmBlock:(() -> Void)?) {
        
        let alertCtrl = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        
        if let cnt = buttonsArray?.count {
            if cnt == 1 {
                alertCtrl.addAction(UIAlertAction.init(title: buttonsArray?.last, style: .default, handler: { (action) in
                    if confirmBlock != nil {
                        confirmBlock!()
                    }
                }))
            } else {
                alertCtrl.addAction(UIAlertAction.init(title: buttonsArray?.first, style: .cancel, handler: nil))
                
                alertCtrl.addAction(UIAlertAction.init(title: buttonsArray?.last, style: .default, handler: { (action) in
                    if confirmBlock != nil {
                        confirmBlock!()
                    }
                }))
            }
        }
        
        self.present(alertCtrl, animated: true, completion: nil)
    }
    
    ///打开epub书籍
    func openBook(_ resource:String?) {
        let config = FolioReaderConfig()
        config.shouldHideNavigationOnTap = false
        let bookPath = Bundle.main.path(forResource: resource, ofType: "epub")
        let folioReader = FolioReader()
        if bookPath == nil {
            SVProgressHUD.showError(withStatus: "书籍目录不存在")
            return
        }
//        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath!, andConfig: config, shouldRemoveEpub: false, animated: true)
        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath!, andConfig: config)
    }
}
















