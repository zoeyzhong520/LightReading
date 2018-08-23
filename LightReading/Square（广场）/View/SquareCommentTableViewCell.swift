//
//  SquareCommentTableViewCell.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/23.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareCommentTableViewCell: UITableViewCell {

    //头像
    lazy var avatarImgView:UIImageView = {
        let avatarImgView = UIImageView(image: UIImage.init(named: ""))
        avatarImgView.backgroundColor = LightGrayColor
        avatarImgView.layer.cornerRadius = fontSizeScale(20)
        avatarImgView.layer.masksToBounds = true
        return avatarImgView
    }()
    
    //用户名
    lazy var userName:UILabel = {
        let userName = UILabel("XXX", font: FifthFont, textColor: BlueColor, alignment: .left)
        return userName
    }()
    
    //用户的评论
    lazy var commentLabel:UILabel = {
        let commentLabel = UILabel("评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论评论", font: FourthFont, textColor: BlackColor, alignment: .left)
        commentLabel.numberOfLines = 0
        return commentLabel
    }()
    
    //时间
    lazy var timeLabel:UILabel = {
        let timeLabel = UILabel("一天前", font: SixthFont, textColor: LightGrayColor, alignment: .left)
        return timeLabel
    }()
    
    //回复按钮
    lazy var replayBtn:UIButton = {
        let replayBtn = UIButton("回复Ta", textColor: LightGrayColor, font: SixthFont, target: self, action: #selector(replayBtnClickAction))
        return replayBtn
    }()
    
    //其他用户对评论的回复
    lazy var replayedComment:UILabel = {
        let replayedComment = UILabel("XXX：对评论的回复对评论的回复对评论的回复对评论的回复对评论的回复", font: FifthFont, textColor: BlackColor, alignment: .left)
        replayedComment.numberOfLines = 0
        return replayedComment
    }()
    
    lazy var squareCommentReplayView:SquareCommentReplayView = {
        let squareCommentReplayView = SquareCommentReplayView(frame: .zero)
        return squareCommentReplayView
    }()
    
    var replayBlock:(() -> Void)?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.contentView.addSubview(avatarImgView)
        avatarImgView.snp.makeConstraints { (make) in
            make.top.left.equalTo(fontSizeScale(20))
            make.size.equalTo(CGSize(width: fontSizeScale(40), height: fontSizeScale(40)))
        }
        
        self.contentView.addSubview(userName)
        userName.snp.makeConstraints { (make) in
            make.topMargin.equalTo(avatarImgView)
            make.left.equalTo(avatarImgView.snp.right).offset(fontSizeScale(10))
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(15))
        }
        
        self.contentView.addSubview(commentLabel)
        commentLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(userName)
            make.top.equalTo(userName.snp.bottom).offset(fontSizeScale(10))
            make.right.equalTo(-fontSizeScale(20))
        }
        
        self.contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(commentLabel)
            make.top.equalTo(commentLabel.snp.bottom).offset(fontSizeScale(20))
            make.size.equalTo(CGSize(width: fontSizeScale(40), height: fontSizeScale(12)))
        }
        
        self.contentView.addSubview(replayBtn)
        replayBtn.snp.makeConstraints { (make) in
            make.left.equalTo(timeLabel.snp.right).offset(fontSizeScale(10))
            make.centerY.equalTo(timeLabel)
            make.size.equalTo(CGSize(width: fontSizeScale(40), height: fontSizeScale(24)))
        }
        
        self.contentView.addSubview(squareCommentReplayView)
        squareCommentReplayView.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(timeLabel)
            make.top.equalTo(timeLabel.snp.bottom).offset(fontSizeScale(20))
            make.right.equalTo(-fontSizeScale(20))
            make.height.equalTo(fontSizeScale(60))
        }
    }
    
    //点击事件
    @objc func replayBtnClickAction() {
        if replayBlock != nil {
            replayBlock!()
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> SquareCommentTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SquareCommentTableViewCellID", for: indexPath) as? SquareCommentTableViewCell
        if cell == nil {
            print("创建cell失败！")
        }
        return cell!
    }
    
    ///获取高度
    class func getHeight() -> CGFloat {
        return fontSizeScale(240)
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
