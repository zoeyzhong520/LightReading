//
//  TopTitleMainView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/18.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class TopTitleMainView: UIView {

    lazy var topTitleScrollBar:TopTitleScrollBar = {
        let frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: fontSizeScale(30))
        let topTitleScrollBar = TopTitleScrollBar(frame: frame, titlesArray: ["全部", "中文文", "古诗鉴赏", "阶梯阅读读", "儿童文学文学", "中文经典文经典", "古诗鉴赏古诗鉴赏", "阶梯阅读赏古诗鉴赏", "儿阶梯阅读赏古诗鉴赏", "儿阶梯阅读赏古诗鉴赏典", "古儿阶梯阅读赏古诗鉴赏典"])
        return topTitleScrollBar
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
        
        self.addSubview(self.topTitleScrollBar)
        
        
    }
}

















