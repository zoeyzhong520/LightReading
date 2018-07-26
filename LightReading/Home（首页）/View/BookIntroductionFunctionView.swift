//
//  BookIntroductionFunctionView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/26.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 功能按钮区 加入书架、离线全本、开始阅读

class BookIntroductionFunctionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = TableViewBackgroundColor
        
        let btnNamesArray = ["加入收藏", "离线全本", "开始阅读"]
        let imgsArray = ["collectImg", "", "startReadingImg"]
        for i in 0..<btnNamesArray.count {
            let viewW:CGFloat = (ScreenWidth - fontSizeScale(15*2) - fontSizeScale(10*2))/3
            let viewH:CGFloat = fontSizeScale(40)
            
            let view = UIView()
            self.addSubview(view)
            view.snp.makeConstraints({ (make) in
                make.left.equalTo(fontSizeScale(15)+CGFloat(i)*(viewW+fontSizeScale(10)))
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: viewW, height: viewH))
            })
            
            let imgView = UIImageView.init(image: UIImage.init(named: imgsArray[i]))
            view.addSubview(imgView)
            imgView.snp.makeConstraints({ (make) in
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
                make.left.equalTo(fontSizeScale(20))
            })
            
            let label = UILabel.init(btnNamesArray[i], font: FourthFont, textColor: BlueColor, alignment: .left)
            view.addSubview(label)
            label.snp.makeConstraints({ (make) in
                make.left.equalTo(imgView.snp.right).offset(fontSizeScale(5))
                make.centerY.right.equalToSuperview()
                make.height.equalTo(viewH)
            })
        }
    }
}














