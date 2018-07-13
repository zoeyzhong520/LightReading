//
//  MineView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class MineView: UIView {

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.backgroundColor = TableViewBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = fontSizeScale(15)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellID")
        tableView.register(MineUserInfoTableViewCell.classForCoder(), forCellReuseIdentifier: "MineUserInfoTableViewCellID")
        return tableView
    }()
    
    var dataArray = [["轻阅读"], ["下载书籍", "个人收藏", "阅读痕迹", "积分商城"], ["设置"]]
    var imagesArray = [[""], ["download", "collection", "readingTrace" ,"pointsMall"], ["setting"]]
    
    var cellClickBlock:((Enums.MineCellType) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.tableView)
        self.tableView.reloadData()
    }
}

extension MineView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            //头像、ID、积分
            let cell = MineUserInfoTableViewCell.createCell(tableView, indexPath: indexPath)
            cell.model = MineModel.setupModel("Joe", userID: "zoeyzhong", score: "1000000000", avatarImg: AvatarImageUrl)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
            cell.textLabel?.font = FourthFont
            cell.textLabel?.textColor = BlackColor
            cell.textLabel?.text = self.dataArray[indexPath.section][indexPath.row]
            cell.imageView?.image = UIImage.init(named: self.imagesArray[indexPath.section][indexPath.row])
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return fontSizeScale(60)
        } else {
            return fontSizeScale(30)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = TableViewBackgroundColor
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var cellType = Enums.MineCellType.UserInfoType
        if indexPath.section == 0 {
            //用户信息cell
            cellType = .UserInfoType
        } else if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                cellType = .DownloadBookType
            case 1:
                cellType = .CollectionType
            case 2:
                cellType = .ReadingTraceType
            case 3:
                cellType = .PointsMallType
            default:
                break
            }
        } else if indexPath.section == 2 {
            cellType = .SettingType
        }
        
        //闭包传值
        if self.cellClickBlock != nil {
            self.cellClickBlock!(cellType)
        }
    }
}
















