//
//  PersonalInformationDefaultTableViewCell.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/14.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class PersonalInformationDefaultTableViewCell: UITableViewCell {

    var model:PersonalInformationModel? {
        didSet {
            self.configModel()
        }
    }
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel("", font: FourthFont, textColor: BlackColor, alignment: .left)
        return titleLabel
    }()
    
    lazy var rightLabel:UILabel = {
        let rightLabel = UILabel("无", font: FifthFont, textColor: LightGrayColor, alignment: .right)
        return rightLabel
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
            make.left.equalTo(fontSizeScale(10))
            make.top.bottom.equalToSuperview()
            make.width.equalTo(ScreenWidth/3)
        }
        
        self.contentView.addSubview(self.rightLabel)
        self.rightLabel.snp.makeConstraints { (make) in
            make.right.equalTo(-fontSizeScale(10))
            make.top.bottom.equalToSuperview()
            make.width.equalTo(ScreenWidth/3)
        }
    }
    
    func configModel() {
        if let type = self.model?.type {
            self.titleLabel.text = self.model?.typeStr
            
            switch type {
            case 0:
                self.rightLabel.text = self.model?.name
            case 1:
                self.rightLabel.text = self.model?.userID
            case 2:
                self.rightLabel.text = self.model?.score
            default:
                break
            }
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> PersonalInformationDefaultTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalInformationDefaultTableViewCellID", for: indexPath) as? PersonalInformationDefaultTableViewCell
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
