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
            self.contentView = UIView(frame: CGRect(x: 0, y: ScreenHeight-ContentViewH, width: ScreenWidth, height: ContentViewH))
            self.addSubview(self.contentView!)
            
            
        }
    }

    func configContentView() {
        
    }
}





















