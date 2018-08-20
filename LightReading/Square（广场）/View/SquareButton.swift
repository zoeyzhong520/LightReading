//
//  SquareButton.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareButton: UIView {

    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel("", font: FourthFont, textColor: BlueColor, alignment: .left)
        return titleLabel
    }()
    
    lazy var imgView:UIImageView = {
        let imgView = UIImageView(image: UIImage.init(named: "")?.withRenderingMode(.alwaysTemplate))
        imgView.tintColor = BlueColor
        return imgView
    }()
    
    var titleText:String? {
        didSet {
            self.titleLabel.text = titleText
            self.titleLabel.snp.updateConstraints { (make) in
                let labelW = titleLabel.text?.sizeArrtibutes(titleLabel.font).width
                let leftConstraint = (ScreenWidth/2-labelW!-fontSizeScale(22))/2
                make.left.equalTo(leftConstraint)
                make.width.equalTo(labelW!)
            }
        }
    }
    
    var imgName:String? {
        didSet {
            self.imgView.image = UIImage.init(named: imgName ?? "")?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    //搜索条件数组
    var filterTitles = [String]()
    
    var clickBlock:(() -> Void)?
    
    var isClicked:Bool = false
    
    var filterView:SquareFilterView?
    
    init(frame: CGRect, filterTitles:[String]) {
        super.init(frame: frame)
        self.filterTitles = filterTitles
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
        
        self.addSubview(titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            
            let labelW = titleLabel.text?.sizeArrtibutes(titleLabel.font).width
            let leftConstraint = (ScreenWidth/2-labelW!-fontSizeScale(22))/2
            make.left.equalTo(leftConstraint)
            make.width.equalTo(labelW!)
        }
        
        self.addSubview(imgView)
        self.imgView.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.right).offset(fontSizeScale(10))
            make.size.equalTo(CGSize(width: fontSizeScale(10), height: fontSizeScale(10)))
            make.centerY.equalToSuperview()
        }
    }
    
    //点击事件
    @objc func tapAction() {
        
        if isClicked == true {
            isClicked = false
            UIView.animate(withDuration: AnimateDuration) {
                self.imgView.transform = CGAffineTransform.identity
            }
            
            self.filterView?.disMiss()
        } else {
            isClicked = true
            UIView.animate(withDuration: AnimateDuration) {
                self.imgView.transform = CGAffineTransform.identity.rotated(by: .pi)
            }
            
            let filterView = SquareFilterView(frame: .zero, titles: self.filterTitles)
            filterView.show()
            filterView.clickBlock = { [weak self] index in
                self?.isClicked = false//恢复初始状态
                UIView.animate(withDuration: AnimateDuration) {
                    self?.imgView.transform = CGAffineTransform.identity
                }
                print("index = \(index)")
            }
            self.filterView = filterView
        }
    }
}







