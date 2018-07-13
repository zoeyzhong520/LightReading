//
//  MineUserInfoTableViewCell.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class MineUserInfoTableViewCell: UITableViewCell {

    var model:MineModel? {
        didSet {
            self.configModel()
        }
    }
    
    lazy var imgView:UIImageView = {
        let imgView = UIImageView("avatarImg_default", makesToBounds: true, cornerRadius: 5)
        return imgView
    }()
    
    lazy var nameLabel:UILabel = {
        let nameLabel = UILabel(UserdefaultsTool.getToken(), font: FifthFont, textColor: BlackColor, alignment: .left)
        return nameLabel
    }()
    
    lazy var userIDLabel:UILabel = {
        let userIDLabel = UILabel("ID：无", font: SixthFont, textColor: BlackColor, alignment: .left)
        return userIDLabel
    }()
    
    lazy var scoreLabel:UILabel = {
        let scoreLabel = UILabel("积分：无", font: SixthFont, textColor: BlackColor, alignment: .left)
        return scoreLabel
    }()
    
    lazy var arrowImgView:UIImageView = {
        //mineUserInfo_rightArrow
        let arrowImgView = UIImageView(image: UIImage.init(named: "mineUserInfo_rightArrow"))
        return arrowImgView
    }()
    
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
        
        self.contentView.addSubview(self.imgView)
        self.imgView.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(10))
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(40), height: fontSizeScale(40)))
        }
        
        self.contentView.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imgView.snp.right).offset(fontSizeScale(10))
            make.topMargin.equalTo(self.imgView)
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(16))
        }
        
        self.contentView.addSubview(self.userIDLabel)
        self.userIDLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(self.nameLabel)
            make.top.equalTo(self.nameLabel.snp.bottom)
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(13))
        }
        
        self.contentView.addSubview(self.scoreLabel)
        self.scoreLabel.snp.makeConstraints { (make) in
            make.leftMargin.equalTo(self.userIDLabel)
            make.top.equalTo(self.userIDLabel.snp.bottom)
            make.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(13))
        }
        
        self.contentView.addSubview(self.arrowImgView)
        self.arrowImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
            make.centerY.equalToSuperview()
        }
    }
    
    func configModel() {
        self.nameLabel.text = self.model?.name
        
        if let userID = self.model?.userID {
            self.userIDLabel.text = "ID：\(userID)"
        }
        
        if let score = self.model?.score {
            self.scoreLabel.text = "积分：\(score)"
        }
        
        if let avatarImg = self.model?.avatarImg {
            print(avatarImg)
            self.imgView.sd_setImage(with: URL.init(string: avatarImg), placeholderImage: PlaceholderImage)
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> MineUserInfoTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineUserInfoTableViewCellID", for: indexPath) as? MineUserInfoTableViewCell
        if cell == nil {
            print("创建cell失败")
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
