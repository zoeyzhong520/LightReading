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
        let imgView = UIImageView(image: UIImage.init(named: "avatarImg_default"))
        return imgView
    }()
    
    lazy var nameLabel:UILabel = {
        let nameLabel = UILabel("Joe", font: FifthFont, textColor: BlackColor, alignment: .left)
        return nameLabel
    }()
    
    lazy var userIDLabel:UILabel = {
        let userIDLabel = UILabel("zhongzhaojunJoe", font: SixthFont, textColor: BlackColor, alignment: .left)
        return userIDLabel
    }()
    
    lazy var scoreLabel:UILabel = {
        let scoreLabel = UILabel("88888888", font: SixthFont, textColor: BlackColor, alignment: .left)
        return scoreLabel
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
        
    }
    
    func configModel() {
        self.nameLabel.text = self.model?.name
        self.userIDLabel.text = self.model?.userID
        self.scoreLabel.text = self.model?.score
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
