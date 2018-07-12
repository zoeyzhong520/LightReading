//
//  LoginView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class LoginView: UIView {

    lazy var accountTF:UITextField = {
        let accountTF = UITextField("请输入您的账号", backgroundColor: CommonBackgroundColor, font: FifthFont, makesToBounds: true, cornerRadius: 5, borderWidth: fontSizeScale(0.5), borderColor: CommonBackgroundColor)
        accountTF.addLeftImageView("accountImg")
        accountTF.delegate = self
        accountTF.returnKeyType = .done
        return accountTF
    }()
    
    lazy var passwordTF:UITextField = {
        let passwordTF = UITextField("请输入您的密码", backgroundColor: CommonBackgroundColor, font: FifthFont, makesToBounds: true, cornerRadius: 5, borderWidth: fontSizeScale(0.5), borderColor: CommonBackgroundColor)
        passwordTF.addLeftImageView("passwordImg")
        passwordTF.delegate = self
        passwordTF.returnKeyType = .done
        return passwordTF
    }()
    
    lazy var loginBtn:UIButton = {
        let loginBtn = UIButton("登录", textColor: .white, font: FourthFont, backgroundColor: CommonBackgroundColor, makesToBounds: true, cornerRadius: 22, borderWidth: fontSizeScale(0.5), borderColor: CommonBackgroundColor, target: self, action: #selector(clickAction(_:)))
        loginBtn.tag = 0
        loginBtn.isUserInteractionEnabled = false
        return loginBtn
    }()
    
    var loginBlock:((LoginModel) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.accountTF)
        self.accountTF.snp.makeConstraints { (make) in
            make.top.equalTo(fontSizeScale(250))
            make.left.equalTo(fontSizeScale(50))
            make.right.equalTo(-fontSizeScale(50))
            make.height.equalTo(fontSizeScale(44))
        }
        
        self.addSubview(self.passwordTF)
        self.passwordTF.snp.makeConstraints { (make) in
            make.top.equalTo(self.accountTF.snp.bottom).offset(fontSizeScale(20))
            make.left.equalTo(fontSizeScale(50))
            make.right.equalTo(-fontSizeScale(50))
            make.height.equalTo(fontSizeScale(44))
        }
        
        self.addSubview(self.loginBtn)
        self.loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(self.passwordTF.snp.bottom).offset(fontSizeScale(40))
            make.left.equalTo(fontSizeScale(80))
            make.right.equalTo(-fontSizeScale(80))
            make.height.equalTo(fontSizeScale(44))
        }
        
        self.addNotification()
    }

    ///添加监听
    func addNotification() {
        self.accountTF.addTarget(self, action: #selector(accountTFTextChange), for: .editingChanged)
        self.passwordTF.addTarget(self, action: #selector(passwordTFTextChange), for: .editingChanged)
    }
    
    @objc func accountTFTextChange() {
        self.isCorrrect()
    }
    
    @objc func passwordTFTextChange() {
        self.isCorrrect()
    }
    
    ///判断账号密码
    func isCorrrect() {
        if self.accountTF.text?.isEmpty == false && self.passwordTF.text?.isEmpty == false {
            self.loginBtn.isUserInteractionEnabled = true
            self.loginBtn.backgroundColor = BlurColor
        } else {
            self.loginBtn.isUserInteractionEnabled = false
            self.loginBtn.backgroundColor = CommonBackgroundColor
        }
        
        //只能输入数字和字母
        let cs = NSCharacterSet(charactersIn: ALPHANUM).inverted
        let account = self.accountTF.text ?? ""
        let password = self.passwordTF.text ?? ""
        let filteredAccount = account.components(separatedBy: cs).joined(separator: "")
        let filteredPassword = password.components(separatedBy: cs).joined(separator: "")
        
        if account != filteredAccount {
            SVProgressHUD.showInfo(withStatus: "不能输入空格")
            self.accountTF.resignFirstResponder()
            self.accountTF.text = ""
            return
        }
        
        if password != filteredPassword {
            SVProgressHUD.showInfo(withStatus: "不能输入空格")
            self.passwordTF.resignFirstResponder()
            self.passwordTF.text = ""
            return
        }
    }
    
    @objc func clickAction(_ button:UIButton) {
        if button.tag == 0 {
            //登录按钮
            if self.accountTF.text?.isEmpty == true {
                SVProgressHUD.showInfo(withStatus: "请输入正确的账号")
                return
            }
            
            if self.passwordTF.text?.isEmpty == true {
                SVProgressHUD.showInfo(withStatus: "请输入正确的密码")
                return
            }
            
            //闭包传值
            if self.loginBlock != nil {
                self.loginBlock!(LoginModel.setupModel(self.accountTF.text!, password: self.passwordTF.text!))
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}

extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.accountTF.resignFirstResponder()
        self.passwordTF.resignFirstResponder()
        return true
    }
}









