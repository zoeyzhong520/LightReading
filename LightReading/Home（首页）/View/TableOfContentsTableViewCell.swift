//
//  TableOfContentsTableViewCell.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class TableOfContentsTableViewCell: UITableViewCell {

    lazy var label:UILabel = {
        let label = UILabel("第一章", font: FourthFont, textColor: BlackColor, alignment: .left)
        return label
    }()
    
    lazy var bottomLine:UIView = {
        let bottomLine = UIView(LineBackgroundColor)
        return bottomLine
    }()
    
    var labelText:String? {
        didSet {
            self.label.text = labelText
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
        self.backgroundColor = .white
        
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(self.label)
        self.label.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, fontSizeScale(15), 0, 0))
        }
        
        self.contentView.addSubview(self.bottomLine)
        self.bottomLine.snp.makeConstraints { (make) in
            make.bottom.right.equalToSuperview()
            make.left.equalTo(fontSizeScale(15))
            make.height.equalTo(fontSizeScale(1))
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> TableOfContentsTableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableOfContentsTableViewCellID", for: indexPath) as? TableOfContentsTableViewCell
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
