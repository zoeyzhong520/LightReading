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

    ///封面、书名等
    lazy var bookCoverView:BookIntroductionBookCoverView = {
        let bookCoverView = BookIntroductionBookCoverView(frame: .zero)
        return bookCoverView
    }()
    
    ///功能按钮区 加入书架、离线全本、开始阅读
    lazy var functionView:BookIntroductionFunctionView = {
        let functionView = BookIntroductionFunctionView(frame: .zero)
        return functionView
    }()
    
    ///简介
    lazy var intructionView:UIView = {
        let intructionView = UIView(.white)
        intructionView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
        return intructionView
    }()
    
    lazy var intructionTitle:UILabel = {
        let intructionTitle = UILabel("简介", font: FifthFont, textColor: BlackColor, alignment: .left)
        return intructionTitle
    }()
    
    lazy var intructionLabel:UILabel = {
        let intructionLabel = UILabel("10岁的少女千寻与父母一起从都市搬家到了乡下。没想到在搬家的途中，一家人发生了意外。他们进入了汤屋老板魔女控制的奇特世界——在那里不劳动的人将会被变成动物。千寻的爸爸妈妈因贪吃变成了猪，千寻为了救爸爸妈妈经历了很多磨难，在期间她遇见了白龙，一个既聪明又冷酷的少年，在经历了很多事情之后，千寻最后救出了爸爸妈妈，拯救了白龙", font: SixthFont, textColor: LightGrayColor, alignment: .left)
        intructionLabel.lineBreakMode = .byTruncatingTail
        intructionLabel.numberOfLines = 0
        intructionLabel.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
        return intructionLabel
    }()
    
    lazy var intructionRightImgView:UIImageView = {
        let intructionRightImgView = UIImageView(image: UIImage.init(named: "checkMoreImg")?.withRenderingMode(.alwaysTemplate))
        intructionRightImgView.tintColor = LightGrayColor
        return intructionRightImgView
    }()
    
    ///点击查看全部简介
    var checkAllIntructionBlock:((CGFloat) -> Void)?
    
    var clickBlock:((Enums.BookDetailCellType) -> Void)?
    
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
        
        self.addSubview(self.bookCoverView)
        self.bookCoverView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(140))
        }
        
        self.addSubview(self.functionView)
        self.functionView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.bookCoverView.snp.bottom)
            make.height.equalTo(fontSizeScale(60))
        }
        self.functionView.tapBlock = { [weak self] clickType in
            if self?.clickBlock != nil {
                self?.clickBlock!(clickType)
            }
        }
        
        self.addSubview(self.intructionView)
        self.intructionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.functionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(100))
        }
        
        self.intructionView.addSubview(self.intructionTitle)
        self.intructionTitle.snp.makeConstraints { (make) in
            make.top.left.equalTo(fontSizeScale(15))
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(16))
        }
        
        self.intructionView.addSubview(self.intructionLabel)
        self.intructionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.intructionTitle.snp.bottom).offset(fontSizeScale(10))
            make.leftMargin.equalTo(self.intructionTitle)
            make.right.equalTo(-fontSizeScale(15))
            make.bottom.equalTo(-fontSizeScale(15))
        }
        
        self.intructionView.addSubview(self.intructionRightImgView)
        self.intructionRightImgView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-fontSizeScale(15))
            make.right.equalTo(-fontSizeScale(5))
            make.size.equalTo(CGSize(width: fontSizeScale(10), height: fontSizeScale(10)))
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> BookIntroductionTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookIntroductionTableViewCellID", for: indexPath) as? BookIntroductionTableViewCell
        if cell == nil {
            print("创建cell失败")
        }
        return cell!
    }
    
    ///单击事件处理
    @objc func tapAction() {
        self.intructionRightImgView.isHidden = true
        
        let intructionLabelH:CGFloat = self.getIntructionLabelH()
        
        self.intructionView.snp.updateConstraints({ (make) in//更新高度值
            make.height.equalTo(fontSizeScale(intructionLabelH+56))
        })
        
        if self.checkAllIntructionBlock != nil {
            self.checkAllIntructionBlock!(intructionLabelH)
        }
    }
    
    ///计算intructionLabel的文本高度值
    func getIntructionLabelH() -> CGFloat {
        if let size = self.intructionLabel.text?.sizeAttributes(ScreenWidth-fontSizeScale(15*2), height: CGFloat(MAXFLOAT), font: SixthFont) {
            
            return size.height
        }
        return 0.0
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
