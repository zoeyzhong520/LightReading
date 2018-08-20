//
//  SquareFilterTableViewCell.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/20.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareFilterTableViewCell: UITableViewCell {

    lazy var label:UILabel = {
        let label = UILabel("", font: FourthFont, textColor: LightGrayColor, alignment: .center)
        return label
    }()
    
    var titleText:String? {
        didSet {
            self.label.text = titleText
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
        self.contentView.addSubview(label)
        label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    ///创建cell
    class func createCell(_ tableView:UITableView, indexPath:IndexPath) -> SquareFilterTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SquareFilterTableViewCellID", for: indexPath) as? SquareFilterTableViewCell
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
