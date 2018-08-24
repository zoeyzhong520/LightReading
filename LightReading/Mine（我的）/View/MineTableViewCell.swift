//
//  MineTableViewCell.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/24.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {

    lazy var imgView:UIImageView = {
        let imgView = UIImageView(image: UIImage.init(named: ""))
        return imgView
    }()
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel("", font: FourthFont, textColor: BlackColor, alignment: .left)
        return titleLabel
    }()
    
    lazy var arrowImgView:UIImageView = {
        //mineUserInfo_rightArrow
        let arrowImgView = UIImageView(image: UIImage.init(named: "mineUserInfo_rightArrow"))
        return arrowImgView
    }()
    
    lazy var bottomLine:UIView = {
        let bottomLine = UIView(LineBackgroundColor)
        return bottomLine
    }()
    
    var imgStr:String? {
        didSet {
            self.imgView.image = UIImage.init(named: imgStr ?? "")
        }
    }
    
    var titleText:String? {
        didSet {
            self.titleLabel.text = titleText
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
        self.contentView.addSubview(imgView)
        self.imgView.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(10))
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: fontSizeScale(22), height: fontSizeScale(22)))
        }
        
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imgView.snp.right).offset(fontSizeScale(10))
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: ScreenWidth/2, height: fontSizeScale(16)))
        }
        
        self.contentView.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            make.right.bottom.equalToSuperview()
            make.leftMargin.equalTo(self.titleLabel)
            make.height.equalTo(fontSizeScale(0.5))
        }
        
        self.contentView.addSubview(self.arrowImgView)
        self.arrowImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
            make.centerY.equalToSuperview()
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> MineTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineTableViewCellID", for: indexPath) as? MineTableViewCell
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
