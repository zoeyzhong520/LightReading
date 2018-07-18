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
        return loginView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.view.addSubview(self.loginView)
        self.loginView.loginBlock = { [weak self] loginModel in
            print("account == \(loginModel.account), password == \(loginModel.password)")
            self?.login(loginModel.account, password: loginModel.password)
        }
    }
    
    ///登录
    func login(_ account:String, password:String) {
        if account == "Joe" && password == "123" {
            appDelegate.window?.rootViewController = MainTabBarViewController()
            UserdefaultsTool.setToken(account)
        } else {
            SVProgressHUD.showError(withStatus: LoginFailureStr)
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
