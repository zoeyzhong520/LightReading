//
//  SquareTableViewCell.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/20.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareTableViewCell: UITableViewCell {

    //头像
    lazy var avatarImgView:UIImageView = {
        let avatarImgView = UIImageView(image: UIImage.init(named: "avatarImg_default"))
        avatarImgView.layer.cornerRadius = 5
        avatarImgView.layer.masksToBounds = true
        return avatarImgView
    }()
    
    //角色名
    lazy var characterName:UILabel = {
        let characterName = UILabel("XXXXX", font: FifthFont, textColor: BlueColor, alignment: .left)
        return characterName
    }()
    
    //时间
    lazy var timeLabel:UILabel = {
        let timeLabel = UILabel("8小时前", font: SixthFont, textColor: LightGrayColor, alignment: .right)
        return timeLabel
    }()
    
    //内容
    lazy var contentLabel:UILabel = {
        let contentLabel = UILabel("内容内容内容内容内容内容内容内容内容内容内容内容内容内容", font: FourthFont, textColor: BlackColor, alignment: .left)
        contentLabel.numberOfLines = 0
        return contentLabel
    }()
    
    //评论按钮
    lazy var commentBtn:UIButton = {
        let commentBtn = UIButton("8888", textColor: LightGrayColor, font: SixthFont, target: self, action: #selector(clickAction(_:)))
        commentBtn.setImage(UIImage.init(named: "squareCommentImg"), for: .normal)
        commentBtn.setEdgeInsets(UIEdgeInsetsMake(0, -fontSizeScale(5), 0, 0), titleEdgeInsets: UIEdgeInsetsMake(0, fontSizeScale(5), 0, 0))
        commentBtn.tag = 0
        return commentBtn
    }()
    
    //点赞按钮
    lazy var likeBtn:UIButton = {
        let likeBtn = UIButton("888", textColor: LightGrayColor, font: SixthFont, target: self, action: #selector(clickAction(_:)))
        likeBtn.setImage(UIImage.init(named: "squareLikeImg"), for: .normal)
        likeBtn.setEdgeInsets(UIEdgeInsetsMake(0, -fontSizeScale(5), 0, 0), titleEdgeInsets: UIEdgeInsetsMake(0, fontSizeScale(5), 0, 0))
        likeBtn.tag = 1
        return likeBtn
    }()
    
    ///是否点赞
    var isLiked = false
    
    var clickBlock:(() -> Void)?
    
    //点击事件
    @objc func clickAction(_ button:UIButton) {
        if button.tag == 1 {//点赞
            isLiked = !isLiked
            button.setImage(UIImage.init(named: isLiked ? "squareLikeImg_select" : "squareLikeImg"), for: .normal)
        } else if button.tag == 0 {//评论
            if clickBlock != nil {
                clickBlock!()
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.contentView.addSubview(self.avatarImgView)
        avatarImgView.snp.makeConstraints { (make) in
            make.top.left.equalTo(fontSizeScale(20))
            make.size.equalTo(CGSize(width: fontSizeScale(40), height: fontSizeScale(40)))
        }
        
        self.contentView.addSubview(self.characterName)
        characterName.snp.makeConstraints { (make) in
            make.topMargin.equalTo(self.avatarImgView)
            make.left.equalTo(avatarImgView.snp.right).offset(fontSizeScale(20))
            make.size.equalTo(CGSize(width: ScreenWidth/2, height: fontSizeScale(15)))
        }
        
        self.contentView.addSubview(self.timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(characterName)
            make.right.equalTo(-fontSizeScale(20))
            make.size.equalTo(CGSize(width: ScreenWidth/2, height: fontSizeScale(12)))
        }
        
        self.contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(characterName)
            make.top.equalTo(characterName.snp.bottom).offset(fontSizeScale(10))
            make.right.equalTo(-fontSizeScale(20))
        }
        
        self.contentView.addSubview(commentBtn)
        commentBtn.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(contentLabel)
            make.top.equalTo(contentLabel.snp.bottom).offset(fontSizeScale(20))
            make.size.equalTo(CGSize(width: fontSizeScale(60), height: fontSizeScale(24)))
        }
        
        self.contentView.addSubview(likeBtn)
        likeBtn.snp.makeConstraints { (make) in
            make.centerY.equalTo(commentBtn)
            make.left.equalTo(commentBtn.snp.right).offset(fontSizeScale(20))
            make.size.equalTo(CGSize(width: fontSizeScale(60), height: fontSizeScale(24)))
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> SquareTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SquareTableViewCellID", for: indexPath) as? SquareTableViewCell
        if cell == nil {
            print("创建cell失败！")
        }
        return cell!
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
