//
//  BookCommentTableViewCell.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 书籍评论展示cell

class BookCommentTableViewCell: UITableViewCell {

    lazy var leftTitleLabel:UILabel = {
        let leftTitleLabel = UILabel("最新评论", font: FourthFont, textColor: BlackColor, alignment: .left)
        return leftTitleLabel
    }()
    
    lazy var writeCommentBtn:UIButton = {
        let writeCommentBtn = UIButton("写评论", textColor: BlueColor, font: FifthFont, target: self, action: #selector(clickAction))
        writeCommentBtn.setImage(UIImage.init(named: "writeCommentImg")?.withRenderingMode(.alwaysTemplate), for: .normal)
        writeCommentBtn.imageView?.tintColor = BlueColor
        return writeCommentBtn
    }()
    
    lazy var avatarImgView:UIImageView = {
        let avatarImgView = UIImageView(makesToBounds: true, cornerRadius: fontSizeScale(15))
        return avatarImgView
    }()
    
    lazy var nameLabel:UILabel = {
        let nameLabel = UILabel("名侦探柯南", font: SixthFont, textColor: BlueColor, alignment: .left)
        return nameLabel
    }()
    
    lazy var commentLabel:UILabel = {
        let commentLabel = UILabel("高中生侦探工藤新一和青梅竹马的同学毛利兰一同去游乐园玩的时候，目击了黑衣男子的可疑交易现场。只顾偷看交易的工藤新一，却忽略了从背后接近的另一名同伙。他被那名男子灌下了毒药，当他醒来时，身体居然缩小了！ 如果让那些家伙知道工藤新一还活着的话，不仅性命难保，还会危及身边的人。在阿笠博士的建议下他决定隐瞒身份，在被小兰问及名字时，化名江户川柯南，为了搜集那些家伙的情报，寄住在父亲以侦探为业的小兰家中。 谜团重重的黑衣组织……他所了解的，就只有他们是以酒的名称作为代号的。为了揭露那些家伙的真面目，小小侦探江户川柯南的活跃开始了！", font: FifthFont, textColor: BlackColor, alignment: .left)
        commentLabel.numberOfLines = 0
        commentLabel.lineBreakMode = .byTruncatingTail
        return commentLabel
    }()
    
    lazy var bottomLine:UIView = {
        let bottomLine = UIView(LineBackgroundColor)
        return bottomLine
    }()
    
    var indexPath:IndexPath? {
        didSet {
            self.configIndexPath()
        }
    }
    
    var commentBlock:(() -> Void)?
    
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
        
        self.contentView.addSubview(self.leftTitleLabel)
        self.leftTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(fontSizeScale(15))
            make.left.equalTo(fontSizeScale(20))
            make.size.equalTo(CGSize(width: ScreenWidth/2, height: fontSizeScale(17)))
        }
        
        self.contentView.addSubview(self.writeCommentBtn)
        self.writeCommentBtn.snp.makeConstraints { (make) in
            make.top.equalTo(fontSizeScale(15))
            make.right.equalTo(-fontSizeScale(20))
            make.size.equalTo(CGSize(width: fontSizeScale(24), height: fontSizeScale(24)))
        }
        
        self.avatarImgView.sd_setImage(with: URL.init(string: AvatarImageUrl), placeholderImage: PlaceholderImage)
        self.contentView.addSubview(self.avatarImgView)
        self.avatarImgView.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(20))
            make.top.equalTo(fontSizeScale(52))
            make.size.equalTo(CGSize(width: fontSizeScale(30), height: fontSizeScale(30)))
        }
        
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.avatarImgView.snp.right).offset(fontSizeScale(20))
            make.topMargin.equalTo(self.avatarImgView).offset(fontSizeScale(3))
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(13))
        }
        
        self.contentView.addSubview(self.commentLabel)
        self.commentLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp.bottom)
            make.right.bottom.equalTo(-fontSizeScale(20))
        }
        
        self.contentView.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(fontSizeScale(1))
        }
    }
    
    @objc func clickAction() {
        if self.commentBlock != nil {
            self.commentBlock!()
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> BookCommentTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookCommentTableViewCellID", for: indexPath) as? BookCommentTableViewCell
        if cell == nil {
            print("创建cell失败")
        }
        cell?.indexPath = indexPath
        return cell!
    }
    
    func configIndexPath() {
        let shouldHidden = self.indexPath?.row == 0 ? false : true
        
        self.leftTitleLabel.isHidden = shouldHidden
        self.writeCommentBtn.isHidden = shouldHidden
        
        self.avatarImgView.snp.updateConstraints { (make) in
            make.top.equalTo(shouldHidden ? fontSizeScale(15) : fontSizeScale(52))
        }
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
