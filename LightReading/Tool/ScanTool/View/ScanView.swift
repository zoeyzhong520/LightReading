//
//  ScanView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/25.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class ScanView: UIView {

    lazy var leftTopImgView:UIImageView = {
        let leftTopImgView = UIImageView.init(image: UIImage.init(named: "leftTopImg"))
        return leftTopImgView
    }()
    
    lazy var leftBottomImgView:UIImageView = {
        let leftBottomImgView = UIImageView.init(image: UIImage.init(named: "leftBottomImg"))
        return leftBottomImgView
    }()
    
    lazy var rightTopImgView:UIImageView = {
        let rightTopImgView = UIImageView.init(image: UIImage.init(named: "rightTopImg"))
        return rightTopImgView
    }()
    
    lazy var rightBottomImgView:UIImageView = {
        let rightBottomImgView = UIImageView.init(image: UIImage.init(named: "rightBottomImg"))
        return rightBottomImgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .clear
        
        self.addSubview(self.leftTopImgView)
        self.leftTopImgView.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(44), height: fontSizeScale(44)))
        }
        
        self.addSubview(self.leftBottomImgView)
        self.leftBottomImgView.snp.makeConstraints { (make) in
            make.left.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(44), height: fontSizeScale(44)))
        }
        
        self.addSubview(self.rightTopImgView)
        self.rightTopImgView.snp.makeConstraints { (make) in
            make.right.top.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(44), height: fontSizeScale(44)))
        }
        
        self.addSubview(self.rightBottomImgView)
        self.rightBottomImgView.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(44), height: fontSizeScale(44)))
        }
    }
}











