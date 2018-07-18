//
//  SettingTableViewCell.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {
    
    var model:SettingModel? {
        didSet {
            self.configModel()
        }
    }
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel.init("清除缓存", font: FourthFont, textColor: BlackColor, alignment: .left)
        return titleLabel
    }()
    
    lazy var rightLabel:UILabel = {
        let rightLabel = UILabel.init("0K", font: FifthFont, textColor: LightGrayColor, alignment: .right)
        return rightLabel
    }()
    
    lazy var line:UIView = {
        let line = UIView.init(LineBackgroundColor)
        return line
    }()
    
    lazy var arrowImgView:UIImageView = {
        //mineUserInfo_rightArrow
        let arrowImgView = UIImageView(image: UIImage.init(named: "mineUserInfo_rightArrow"))
        arrowImgView.isHidden = true
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
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(10))
            make.top.bottom.equalToSuperview()
            make.width.equalTo(ScreenWidth/2)
        }
        
        self.addSubview(self.rightLabel)
        self.rightLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.top.bottom.equalToSuperview()
            make.width.equalTo(ScreenWidth/2)
        }
        
        self.contentView.addSubview(self.arrowImgView)
        self.arrowImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(self.line)
        self.line.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(1))
        }
    }
    
    func configModel() {
        self.titleLabel.text = self.model?.titleText
        
        if let type = self.model?.type {
            switch type {
            case "0"://清除缓存
                self.rightLabel.text = String(format: "%.2fM", ClearCacheTool.checkCacheSize())
            case "1"://版本号
                self.rightLabel.text = AppBulidVersion
            case "2"://关于我们
                self.arrowImgView.isHidden = false
                self.rightLabel.isHidden = true
            default:
                break
            }
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> SettingTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCellID", for: indexPath) as? SettingTableViewCell
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
