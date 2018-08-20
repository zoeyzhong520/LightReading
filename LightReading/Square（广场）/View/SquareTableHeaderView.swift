//
//  SquareTableHeaderView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareTableHeaderView: UIView {

    lazy var leftDefaultBtn:SquareButton = {
        let leftDefaultBtn = SquareButton(frame: .zero, filterTitles: ["全部", "一天前", "三天前", "一个月前"])
        leftDefaultBtn.titleText = "全部"
        leftDefaultBtn.imgName = "topArrow"
        return leftDefaultBtn
    }()
    
    lazy var rightDefaultBtn:SquareButton = {
        let rightDefaultBtn = SquareButton(frame: .zero, filterTitles: ["默认排序", "点赞排序", "评论排序"])
        rightDefaultBtn.titleText = "默认排序"
        rightDefaultBtn.imgName = "topArrow"
        return rightDefaultBtn
    }()
    
    lazy var line:UIView = {
        let line = UIView(LineBackgroundColor)
        return line
    }()
    
    lazy var bottomLine:UIView = {
        let bottomLine = UIView(LineBackgroundColor)
        return bottomLine
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.leftDefaultBtn)
        self.leftDefaultBtn.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(ScreenWidth/2)
        }
        
        self.addSubview(self.rightDefaultBtn)
        self.rightDefaultBtn.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.width.equalTo(ScreenWidth/2)
        }
        
        self.addSubview(self.line)
        self.line.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(1), height: fontSizeScale(20)))
        }
        
        self.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(fontSizeScale(0.5))
        }
    }
    
}















