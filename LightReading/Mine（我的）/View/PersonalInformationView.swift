//
//  PersonalInformationView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/14.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class PersonalInformationView: UIView {

    var model:MineModel? {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .grouped)
        tableView.backgroundColor = TableViewBackgroundColor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = fontSizeScale(15)
        tableView.register(PersonalInformationTableViewCell.self, forCellReuseIdentifier: "PersonalInformationTableViewCellID")
        tableView.register(PersonalInformationDefaultTableViewCell.self, forCellReuseIdentifier: "PersonalInformationDefaultTableViewCellID")
        return tableView
    }()
    
    var dataArray = [["", "名字", "ID", "积分"]]
    
    var cellClickBlock:((Enums.PersonalInformationCellType) -> Void)?
    
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

extension PersonalInformationView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
         cell.model = MineModel.setupModel("Joe", userID: "zoeyzhong", score: "1000000000", avatarImg: AvatarImageUrl)
         */
        if indexPath.section == 0 {
            
            let model = PersonalInformationModel.setupModel(self.dataArray[indexPath.section][indexPath.row], type: indexPath.row-1, name: "Joe", userID: "zoeyzhong", score: "1000000000", avatarImg: AvatarImageUrl)
            
            if indexPath.row == 0 {
                let cell = PersonalInformationTableViewCell.createCell(tableView, indexPath: indexPath)
                cell.model = model
                return cell
            } else {
                let cell = PersonalInformationDefaultTableViewCell.createCell(tableView, indexPath: indexPath)
                cell.model = model
                cell.selectionStyle = .none
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var cellType = Enums.PersonalInformationCellType.AvatarType
        switch indexPath.row {
        case 0:
            cellType = .AvatarType
        case 1:
            cellType = .NameType
        case 2:
            cellType = .UserIDType
        case 3:
            cellType = .ScoreType
        default:
            break
        }
        
        if self.cellClickBlock != nil {
            self.cellClickBlock!(cellType)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return fontSizeScale(60)
            } else {
                return fontSizeScale(30)
            }
        }
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView()
        header.backgroundColor = TableViewBackgroundColor
        return header
    }
}













