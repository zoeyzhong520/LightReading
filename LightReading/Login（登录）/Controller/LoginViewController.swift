//
//  LoginViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 登录

class LoginViewController: BaseViewController {

    lazy var loginView:LoginView = {
        let loginView = LoginView(frame: self.view.bounds)
        loginView.loginBlock = { [weak self] loginModel in
            print("account == \(loginModel.account), password == \(loginModel.password)")
            self?.login(loginModel.account, password: loginModel.password)
        }
        return loginView
    }()
    
    lazy var closeBtn:UIButton = {
        let closeBtn = UIButton("❌", textColor: BlueColor, font: FourthFont, target: self, action: #selector(closeButonClick))
        return closeBtn
    }()
    
    ///是否需要显示关闭按钮
    var closeVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.view.addSubview(self.loginView)
        
        self.setCloseButton()
    }
    
    ///登录
    func login(_ account:String, password:String) {
        if account.count > 0 && password.count > 0 {
            appDelegate.window?.rootViewController = MainTabBarViewController()
            UserdefaultsTool.setToken(account)
        } else {
            SVProgressHUD.showError(withStatus: LoginFailureStr)
        }
    }
    
    //设置关闭按钮
    func setCloseButton() {
        if closeVisible {
            self.view.addSubview(closeBtn)
            closeBtn.snp.makeConstraints { (make) in
                make.top.equalTo(fontSizeScale(20)+StatusBarHeight)
                make.left.equalTo(fontSizeScale(20))
                make.size.equalTo(CGSize(width: fontSizeScale(24), height: fontSizeScale(24)))
            }
        }
    }
    
    //点击事件
    @objc func closeButonClick() {
        self.dismiss(animated: true, completion: nil)
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
