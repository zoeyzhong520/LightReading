//
//  BookInputCommentView.swift
//  LightReading
//
//  Created by ZZJ on 2018/8/1.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 输入评论页

class BookInputCommentView: UIView {

    var contentView:UIView?
    
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
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
        
        if contentView == nil {
            contentView = UIView(LightGrayColor)
            contentView?.frame = CGRect(x: 0, y: ScreenHeight-fontSizeScale(100), width: ScreenWidth, height: fontSizeScale(100))
            self.addSubview(contentView!)
            
            self.configContent()
        }
    }
    
    func configContent() {
        
    }
    
    //MARK: 显示View
    func showInView(_ view:UIView?) {
        if view == nil {
            return
        }
        
        view?.addSubview(self)
        
        self.alpha = 0.0
        self.contentView?.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: fontSizeScale(100))
        
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 1.0
            self.contentView?.frame = CGRect(x: 0, y: ScreenHeight-fontSizeScale(100), width: ScreenWidth, height: fontSizeScale(100))
        }, completion: nil)
    }
    
    //MARK: 移除View
    func disMiss() {
        self.alpha = 1.0
        self.contentView?.frame = CGRect(x: 0, y: ScreenHeight-fontSizeScale(100), width: ScreenWidth, height: fontSizeScale(100))
        
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 0.0
            self.contentView?.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: fontSizeScale(100))
        }) { (finished) in
            self.removeFromSuperview()
            self.contentView?.removeFromSuperview()
        }
    }
    
    ///处理Tap手势
    @objc func tapAction() {
        self.disMiss()
    }
}













