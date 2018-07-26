//
//  LRStarView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/26.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class LRStarView: UIView {

    var starSize:CGFloat = 0.0//根据字体大小来确定星星的大小
    
    var maxStar:CGFloat = 0.0//总共的长度
    
    var showStar:CGFloat = 0.0//需要显示的星星的长度
    
    var emptyColor:UIColor!//未点亮时候的颜色
    
    var fullColor:UIColor!//点亮的星星的颜色
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        //初始化
        self.backgroundColor = .clear
        self.starSize = 13.0
        self.emptyColor = RGB(167, 167, 167)
        self.fullColor = RGB(255, 121, 22)
        self.maxStar = 5.0
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        let stars = "★★★★★"
        
        var tmpRect = rect
        tmpRect = self.bounds
        let starSize = (stars as NSString).size(withAttributes: [NSAttributedStringKey.font:DRBoldFont(self.starSize)])
        tmpRect.size = starSize
        print("tmpRect = \(tmpRect)")
        self.emptyColor.set()
        (stars as NSString).draw(in: tmpRect, withAttributes: [NSAttributedStringKey.font:DRBoldFont(self.starSize)])
        
        var clip:CGRect = rect
        clip.size.width = clip.size.width * self.showStar / self.maxStar
        context?.clip(to: clip)
        self.fullColor.set()
        (stars as NSString).draw(in: tmpRect, withAttributes: [NSAttributedStringKey.font:DRBoldFont(self.starSize)])
        self.backgroundColor = .clear
    }
}










