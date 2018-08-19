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
        let leftDefaultBtn = SquareButton(frame: .zero)
        leftDefaultBtn.titleText = "全部"
        leftDefaultBtn.imgName = "topArrow"
        leftDefaultBtn.clickBlock = { [weak self] isClicked in
            self?.setSquareFilterView(["全部", "一天前", "一周前", "一个月前"], shouldShow: isClicked)
        }
        return leftDefaultBtn
    }()
    
    lazy var rightDefaultBtn:SquareButton = {
        let rightDefaultBtn = SquareButton(frame: .zero)
        rightDefaultBtn.titleText = "默认排序"
        rightDefaultBtn.imgName = "topArrow"
        rightDefaultBtn.clickBlock = { [weak self] isClicked in
            self?.setSquareFilterView(["默认排序", "点赞排序", "评论数排序"], shouldShow: isClicked)
        }
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
    
    var filterView:SquareFilterView?
    
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
    
    //set SquareFilterView
    func setSquareFilterView(_ titles:[String], shouldShow:Bool) {
        if shouldShow == false {
            self.filterView?.disMiss()
            return
        }
        
        let filterView = SquareFilterView(frame: .zero, titles: titles)
        filterView.show()
        self.filterView = filterView
    }
}















