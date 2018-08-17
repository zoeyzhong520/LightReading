//
//  SquareFilterView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: - 筛选条件选择页

class SquareFilterView: UIView {

    var contentView:UIView?
    
    var contentViewH = fontSizeScale(180)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = MongolianlayerColor
        self.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapClickAction)))
        
        if contentView == nil {
            contentView = UIView(.white)
            contentView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: contentViewH)
            self.addSubview(contentView!)
            
            self.configContent()
        }
    }
    
    func configContent() {
        
    }
    
    //点击事件
    @objc func tapClickAction() {
        self.disMiss()
    }
    
    //MARK: 显示
    func show() {
        self.alpha = 0.0
        self.contentView?.transform = CGAffineTransform.identity
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 1.0
            self.contentView?.transform = CGAffineTransform.identity.translatedBy(x: 0, y: self.contentViewH)
            LRKeyWindow?.addSubview(self)
        }, completion: nil)
    }
    
    //MARK: 隐藏
    func disMiss() {
        self.alpha = 1.0
        self.contentView?.transform = CGAffineTransform.identity.translatedBy(x: 0, y: self.contentViewH)
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 0.0
            self.contentView?.transform = CGAffineTransform.identity
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
}















