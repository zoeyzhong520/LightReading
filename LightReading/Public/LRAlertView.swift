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
    
    var ContentViewH:CGFloat = fontSizeScale(70)
    
    var buttonsArray = [String]()
    
    init(frame: CGRect, buttonsArray:[String]) {
        super.init(frame: frame)
        self.buttonsArray = buttonsArray
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        self.backgroundColor = MongolianlayerColor
        
        if self.contentView == nil {
            self.contentView = UIView(frame: CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: ContentViewH))
            self.addSubview(self.contentView!)
            
            self.configContentView()
        }
    }

    func configContentView() {
        if self.buttonsArray.isEmpty == false {
            //取消
            let cancelBtn = UIButton.init("取消", textColor: LightGrayColor, font: FourthFont, backgroundColor: .white, target: self, action: #selector(clickAction(_:)))
            cancelBtn.tag = 888
            self.contentView?.addSubview(cancelBtn)
            cancelBtn.snp.makeConstraints({ (make) in
                make.bottom.left.right.equalToSuperview()
                make.height.equalTo(fontSizeScale(30))
            })
            
            for i in 0..<self.buttonsArray.count {
                let btnW = ScreenWidth
                let btnH = fontSizeScale(30)
                
                
            }
        }
    }
    
    @objc func clickAction(_ button:UIButton) {
        if button.tag == 888 {
            //取消按钮
            
        } else {
            
        }
    }
}





















