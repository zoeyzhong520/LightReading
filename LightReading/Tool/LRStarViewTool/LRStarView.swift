//
//  LRStarView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/26.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class LRStarView: UIView {

    var starSize:CGFloat = 13.0//根据字体大小来确定星星的大小
    
    var maxStar:CGFloat = 5.0//总共的长度
    
    var showStar:Int? {//需要显示的星星的长度
        didSet {
            self.configShowStar()
        }
    }
    
    var emptyColor:UIColor = RGB(167, 167, 167)//未点亮时候的颜色
    
    var fullColor:UIColor = RGB(255, 121, 22)//点亮的星星的颜色
    
    lazy var label:UILabel = {
        let label = UILabel("★★★★★", font: DRBoldFont(self.starSize), textColor: self.fullColor, alignment: .center)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
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
        
        self.showStar = 5
        
        self.addSubview(self.label)
        self.label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    ///计算LRStarView的宽度
    func getWidth() -> CGFloat {
        if let str = self.label.text {
            let size = (str as NSString).size(withAttributes: [NSAttributedStringKey.font:self.label.font])
            return size.width
        }
        return 0.0
    }
    
    func configShowStar() {
        if let showStar = self.showStar {
            let arrays = ["★","★★","★★★","★★★★","★★★★★"]
            self.label.text = arrays[showStar-1]
        }
    }
}










