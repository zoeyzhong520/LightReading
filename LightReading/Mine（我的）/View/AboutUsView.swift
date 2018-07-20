//
//  AboutUsView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/18.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class AboutUsView: UIView {
    
    lazy var logoImgView:UIImageView = {
        let logoImgView = UIImageView("")
        logoImgView.backgroundColor = LightGrayColor
        return logoImgView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel("轻阅读 LightReading \(AppBulidVersion ?? "1.0")", font: FourthFont, textColor: LightGrayColor, alignment: .center)
        return titleLabel
    }()
    
    lazy var logoBackView:UIView = {
        let logoBackView = UIView()
        return logoBackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = TableViewBackgroundColor
        
        self.addSubview(self.logoBackView)
        self.logoBackView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.bounds.size.height/2-fontSizeScale(100))
            make.size.equalTo(CGSize(width: ScreenWidth, height: fontSizeScale(100)))
        }
        
        self.logoBackView.addSubview(self.logoImgView)
        self.logoImgView.snp.makeConstraints { (make) in
            make.centerX.top.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(60), height: fontSizeScale(60)))
        }
        
        self.logoBackView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.logoImgView.snp.bottom).offset(fontSizeScale(10))
            make.height.equalTo(fontSizeScale(18))
        }
    }
}
















