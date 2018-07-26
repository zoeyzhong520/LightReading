//
//  BookIntroductionTableViewCell.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/26.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 书籍简介cell

class BookIntroductionTableViewCell: UITableViewCell {

    lazy var bookCoverImgView:UIImageView = {
        let bookCoverImgView = UIImageView()
        return bookCoverImgView
    }()
    
    lazy var bookNameLabel:UILabel = {
        let bookNameLabel = UILabel("千与千寻", font: FourthFont, textColor: BlackColor, alignment: .left)
        return bookNameLabel
    }()
    
    lazy var starView:LRStarView = {
        let starView = LRStarView(frame: CGRect(x: 0, y: 0, width: fontSizeScale(100), height: fontSizeScale(20)))
        starView.showStar = 5
        return starView
    }()
    
    lazy var scoreLabel:UILabel = {
        let scoreLabel = UILabel("5分", font: SixthFont, textColor: BlackColor, alignment: .left)
        return scoreLabel
    }()
    
    lazy var authorLabel:UILabel = {
        let authorLabel = UILabel("宫崎骏", font: SixthFont, textColor: BlackColor, alignment: .left)
        return authorLabel
    }()
    
    ///功能按钮区 加入书架、离线全本、开始阅读
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.contentView.backgroundColor = .white
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
