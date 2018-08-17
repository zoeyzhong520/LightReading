//
//  BookIntroductionFunctionView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/26.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 功能按钮区 加入收藏、离线全本、开始阅读

class BookIntroductionFunctionView: UIView {
    
    var tapBlock:((Enums.BookDetailCellType) -> Void)?
    
    //是否收藏
    var isCollect = false
    
    var collectImgView:UIImageView!
    
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
        let imgsArray = ["collectImg", "downloadImg", "startReadingImg"]
        for i in 0..<btnNamesArray.count {
            let viewW:CGFloat = (ScreenWidth - fontSizeScale(15*2) - fontSizeScale(10*2))/3
            let viewH:CGFloat = fontSizeScale(40)
            
            let view = UIView()
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 5
            view.layer.borderWidth = fontSizeScale(1)
            view.layer.borderColor = BlueColor.cgColor
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
            view.addGestureRecognizer(tap)
            view.tag = i
            
            self.addSubview(view)
            view.snp.makeConstraints({ (make) in
                make.left.equalTo(fontSizeScale(15)+CGFloat(i)*(viewW+fontSizeScale(10)))
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: viewW, height: viewH))
            })
            
            let img = UIImage.init(named: imgsArray[i])?.withRenderingMode(.alwaysTemplate)
            let imgView = UIImageView.init(image: img)
            imgView.tintColor = BlueColor
            if i == 0 {
                self.collectImgView = imgView
            }
            view.addSubview(imgView)
            imgView.snp.makeConstraints({ (make) in
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
                make.left.equalTo(fontSizeScale(15))
            })
            
            let label = UILabel.init(btnNamesArray[i], font: FifthFont, textColor: BlueColor, alignment: .left)
            view.addSubview(label)
            label.snp.makeConstraints({ (make) in
                make.left.equalTo(imgView.snp.right)
                make.centerY.right.equalToSuperview()
                make.height.equalTo(viewH)
            })
        }
    }
    
    @objc func tapAction(_ gesture:UITapGestureRecognizer) {
        if let tag = gesture.view?.tag {//tag = 0，加入收藏；tag = 1，离线全本；tag = 2，开始阅读
            
            var clickType = Enums.BookDetailCellType.Collect
            switch tag {
            case 0:
                clickType = .Collect
                self.collectBook()
            case 1:
                clickType = .Download
            case 2:
                clickType = .StartReading
            default:
                break
            }
            
            if self.tapBlock != nil {
                self.tapBlock!(clickType)
            }
        }
    }
    
    ///收藏事件
    func collectBook() {
        if isCollect {
            isCollect = false
        } else {
            isCollect = true
        }
        
        self.collectImgView.image = UIImage.init(named: isCollect ? "collectImg_select" : "collectImg")?.withRenderingMode(.alwaysTemplate)
    }
}














