//
//  TableOfContentsTableHeaderView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class TableOfContentsTableHeaderView: UIView {

    lazy var bookNameLabel:UILabel = {
        let bookNameLabel = UILabel("千与千寻", font: ThirdFont, textColor: BlackColor, alignment: .center)
        return bookNameLabel
    }()
    
    lazy var authorLabel:UILabel = {
        let authorLabel = UILabel("宫崎骏", font: FifthFont, textColor: LightGrayColor, alignment: .center)
        return authorLabel
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
        
        self.addSubview(self.bookNameLabel)
        self.bookNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fontSizeScale(30))
            make.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(19))
        }
        
        self.addSubview(self.authorLabel)
        self.authorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.bookNameLabel.snp.bottom).offset(fontSizeScale(10))
            make.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(16))
        }
        
        self.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview()
            make.left.equalTo(fontSizeScale(15))
            make.height.equalTo(fontSizeScale(1))
        }
    }
}











