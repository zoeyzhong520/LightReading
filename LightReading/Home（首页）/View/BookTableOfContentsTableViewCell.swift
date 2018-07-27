//
//  BookTableOfContentsTableViewCell.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 书籍目录cell

class BookTableOfContentsTableViewCell: UITableViewCell {

    lazy var leftImgView:UIImageView = {
        let leftImgView = UIImageView(image: UIImage.init(named: "tableOfContentImg")?.withRenderingMode(.alwaysTemplate))
        leftImgView.tintColor = BlueColor
        return leftImgView
    }()
    
    lazy var label:UILabel = {
        let label = UILabel("目录", font: FourthFont, textColor: BlackColor, alignment: .left)
        return label
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
        
        self.addSubview(self.leftImgView)
        self.leftImgView.snp.makeConstraints { (make) in
            make.left.equalTo(fontSizeScale(15))
            make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
            make.centerY.equalToSuperview()
        }
        
        self.addSubview(self.label)
        self.label.snp.makeConstraints { (make) in
            make.left.equalTo(self.leftImgView.snp.right).offset(fontSizeScale(5))
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: ScreenWidth/2, height: fontSizeScale(17)))
        }
        
        self.contentView.addSubview(self.arrowImgView)
        self.arrowImgView.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.size.equalTo(CGSize(width: fontSizeScale(20), height: fontSizeScale(20)))
            make.centerY.equalToSuperview()
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> BookTableOfContentsTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableOfContentsTableViewCellID", for: indexPath) as? BookTableOfContentsTableViewCell
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
