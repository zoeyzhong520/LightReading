//
//  LRAlertView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/16.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class LRAlertView: UIView {
    
    var contentView:UIView?
    
    var ContentViewH:CGFloat = fontSizeScale(90)
    
    var buttonsArray = [String]()
    
    var clickBlock:((Int) -> Void)?
    
    init(frame: CGRect, buttonsArray:[String]) {
        super.init(frame: frame)
        self.buttonsArray = buttonsArray
        self.ContentViewH = CGFloat(buttonsArray.count+1) * fontSizeScale(40) + fontSizeScale(5) + (iPhoneX ? 24 : 0)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = MongolianlayerColor
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(disMiss)))
        
        if self.contentView == nil {
            self.contentView = UIView(frame: CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: ContentViewH))
            self.contentView?.backgroundColor = .white
            self.addSubview(self.contentView!)
            
            self.configContentView()
        }
    }

    func configContentView() {
        if self.buttonsArray.isEmpty == false {
            //取消
            let cancelBtn = UIButton.init("取消", textColor: BlackColor, font: FourthFont, backgroundColor: .white, target: self, action: #selector(clickAction(_:)))
            cancelBtn.tag = 888
            self.contentView?.addSubview(cancelBtn)
            cancelBtn.snp.makeConstraints({ (make) in
                make.bottom.equalTo(iPhoneX ? -24 : 0)
                make.left.right.equalToSuperview()
                make.height.equalTo(fontSizeScale(40))
            })
            
            let line = UIView(MongolianlayerColor)
            self.contentView?.addSubview(line)
            line.snp.makeConstraints({ (make) in
                make.bottom.equalTo(cancelBtn.snp.top)
                make.height.equalTo(fontSizeScale(5))
                make.left.right.equalToSuperview()
            })
            
            for i in 0..<self.buttonsArray.count {
                let btnH = fontSizeScale(40)
                
                let btn = UIButton.init(self.buttonsArray[i], textColor: BlackColor, font: FourthFont, backgroundColor: .white, target: self, action: #selector(clickAction(_:)))
                btn.tag = i
                self.contentView?.addSubview(btn)
                btn.snp.makeConstraints({ (make) in
                    make.left.right.equalToSuperview()
                    make.bottom.equalTo(line.snp.top).offset(-CGFloat(i)*btnH)
                    make.height.equalTo(btnH)
                })
            }
        }
    }
    
    @objc func clickAction(_ button:UIButton) {
        if button.tag == 888 {
            //取消按钮
            
        } else {
            if self.clickBlock != nil {
                self.clickBlock!(button.tag)
            }
        }
        
        self.disMiss()
    }
    
    func showWithBlock(_ clickBlock:@escaping ((Int) -> Void)) {
        self.clickBlock = clickBlock
    }
    
    //MARK: 显示
    func showInView(_ view:UIView?) {
        if view == nil {
            return
        }
        
        view?.addSubview(self)
        self.addSubview(self.contentView!)
        
        self.alpha = 0.0
        self.contentView?.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: ContentViewH)
        
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 1.0
            self.contentView?.frame = CGRect(x: 0, y: ScreenHeight-self.ContentViewH, width: ScreenWidth, height: self.ContentViewH)
        }, completion: nil)
    }
    
    //MARK: 隐藏
    @objc func disMiss() {
        self.alpha = 1.0
        self.contentView?.frame = CGRect(x: 0, y: ScreenHeight-self.ContentViewH, width: ScreenWidth, height: self.ContentViewH)
        
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 0.0
            self.contentView?.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: self.ContentViewH)
        }) { (finished) in
            self.removeFromSuperview()
            self.contentView?.removeFromSuperview()
        }
    }
    
    //MARK: 创建LRAlertView
    ///创建LRAlertView
    class func createLRAlertView(_ buttonsArray:[String], block:@escaping ((Int) -> Void)) {
        
        let alertView = LRAlertView(frame: .zero, buttonsArray: buttonsArray)
        alertView.showInView(LRKeyWindow)
        alertView.showWithBlock(block)
    }
}





















