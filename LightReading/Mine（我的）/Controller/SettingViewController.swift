//
//  SettingViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 设置

class SettingViewController: BaseViewController {

    lazy var settingView:SettingView = {
        let settingView = SettingView(frame: self.view.bounds)
        return settingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.title = "设置"
        
        self.view.addSubview(self.settingView)
        self.settingView.cellClickBlock = { [weak self] cellType in
            switch cellType {
            case .AboutUsType://关于我们
                self?.showViewController("AboutUsViewController", hidesBottomBarWhenPushed:true)
            case .SignOut://退出登录
                self?.showLoginViewController(showAlert: true)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
