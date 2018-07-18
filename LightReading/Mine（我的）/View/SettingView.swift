//
//  SettingView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SettingView: UIView {

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.backgroundColor = TableViewBackgroundColor
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = fontSizeScale(30)
        tableView.sectionHeaderHeight = fontSizeScale(15)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "SettingTableViewCellID")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        return tableView
    }()
    
    var dataArray = [SettingModel]()
    
    var cellClickBlock:((Enums.SettingCellType) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        let array = [["titleText":"清除缓存", "type":"0"], ["titleText":"版本号", "type":"1"], ["titleText":"关于我们", "type":"2"]]
        for dict in array {
            let model = SettingModel()
            model.setValuesForKeys(dict)
            self.dataArray.append(model)
        }
        
        self.addSubview(self.tableView)
        self.tableView.reloadData()
    }
    
    func getCell(_ row:Int, section:Int) -> SettingTableViewCell? {
        return self.tableView.cellForRow(at: IndexPath(row: row, section: section)) as? SettingTableViewCell
    }
}

extension SettingView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {//退出登录
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {//退出登录
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
            cell.textLabel?.text = "退出登录"
            cell.textLabel?.font = FourthFont
            cell.textLabel?.textColor = BlackColor
            cell.textLabel?.textAlignment = .center
            return cell
        } else {
            let cell = SettingTableViewCell.createCell(tableView, indexPath: indexPath)
            cell.model = self.dataArray[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1 {//退出登录
            if self.cellClickBlock != nil {
                self.cellClickBlock!(.SignOut)
            }
        } else {
            if let type = self.dataArray[indexPath.row].type {
                switch type {
                case "0"://清除缓存
                    ClearCacheTool.clearCacheSize()
                    self.getCell(0, section: 0)?.rightLabel.text = "0.00M"
                case "2"://关于我们
                    if self.cellClickBlock != nil {
                        self.cellClickBlock!(.AboutUsType)
                    }
                default:
                    break
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = TableViewBackgroundColor
        return header
    }
}










