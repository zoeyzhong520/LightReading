//
//  BookIntroductionBookCoverView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/26.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 书籍封面及书名等

class BookIntroductionBookCoverView: UIView {

    lazy var bookCoverImgView:UIImageView = {
        let bookCoverImgView = UIImageView()
        return bookCoverImgView
    }()
    
    lazy var bookNameLabel:UILabel = {
        let bookNameLabel = UILabel("千与千寻", font: FourthFont, textColor: BlackColor, alignment: .left)
        return bookNameLabel
    }()
    
    lazy var starView:LRStarView = {
        let starView = LRStarView(frame: .zero)
        return starView
    }()
    
    lazy var scoreLabel:UILabel = {
        let scoreLabel = UILabel("4分", font: SixthFont, textColor: BlackColor, alignment: .left)
        return scoreLabel
    }()
    
    lazy var authorLabel:UILabel = {
        let authorLabel = UILabel("宫崎骏", font: SixthFont, textColor: BlackColor, alignment: .left)
        return authorLabel
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
        
        self.addSubview(self.bookCoverImgView)
        self.bookCoverImgView.snp.makeConstraints { (make) in
            make.top.left.equalTo(fontSizeScale(15))
            make.size.equalTo(CGSize(width: fontSizeScale(80), height: fontSizeScale(110)))
        }
        self.bookCoverImgView.sd_setImage(with: URL.init(string: BookCoverUrl), placeholderImage: PlaceholderImage)
        
        self.addSubview(self.bookNameLabel)
        self.bookNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.bookCoverImgView.snp.right).offset(fontSizeScale(15))
            make.topMargin.equalTo(self.bookCoverImgView).offset(fontSizeScale(3))
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(17))
        }
        
        self.starView.showStar = 4
        self.addSubview(self.starView)
        self.starView.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(self.bookNameLabel)
            make.top.equalTo(self.bookNameLabel.snp.bottom).offset(fontSizeScale(5))
            make.size.equalTo(CGSize(width: self.starView.getWidth(), height: fontSizeScale(20)))
        }
        
        self.addSubview(self.scoreLabel)
        self.scoreLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.starView.snp.right).offset(fontSizeScale(5))
            make.centerY.equalTo(self.starView)
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(13))
        }
        
        self.addSubview(self.authorLabel)
        self.authorLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(self.starView)
            make.top.equalTo(self.starView.snp.bottom).offset(fontSizeScale(10))
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(13))
        }
    }
}












