//
//  PersonalInformationTableViewCell.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/14.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class PersonalInformationTableViewCell: UITableViewCell {

    var model:PersonalInformationModel? {
        didSet {
            self.configModel()
        }
    }
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel("头像", font: FourthFont, textColor: BlackColor, alignment: .left)
        return titleLabel
    }()
    
    lazy var imgView:UIImageView = {
        let imgView = UIImageView("avatarImg_default", makesToBounds: true, cornerRadius: 5)
        return imgView
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
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(fontSizeScale(10))
            make.width.equalTo(ScreenWidth/3)
        }
        
        self.addSubview(self.arrowImgView)
        self.arrowImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
            make.centerY.equalToSuperview()
        }
        
        self.contentView.addSubview(self.imgView)
        self.imgView.snp.makeConstraints { (make) in
            make.right.equalTo(self.arrowImgView.snp.left).offset(-fontSizeScale(10))
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(40), height: fontSizeScale(40)))
        }
    }
    
    func configModel() {
        if let avatarImg = self.model?.avatarImg {
            print(avatarImg)
            self.imgView.sd_setImage(with: URL.init(string: avatarImg), placeholderImage: PlaceholderImage)
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> PersonalInformationTableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInformationTableViewCellID", for: indexPath) as? PersonalInformationTableViewCell
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
