//
//  SquareCommentView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/22.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareCommentView: UIView {

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.rowHeight = fontSizeScale(150)
        tableView.sectionHeaderHeight = fontSizeScale(5)
//        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SquareTableViewCell.self, forCellReuseIdentifier: "SquareTableViewCellID")
        tableView.register(SquareCommentTableViewCell.self, forCellReuseIdentifier: "SquareCommentTableViewCellID")
        return tableView
    }()
    
    var replayBlock:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        addSubview(self.tableView)
        self.tableView.reloadData()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension SquareCommentView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = SquareTableViewCell.createCell(tableView, indexPath: indexPath)
            cell.ISSQUARECOMMENT = true
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = SquareCommentTableViewCell.createCell(tableView, indexPath: indexPath)
        cell.selectionStyle = .none
        cell.replayBlock = self.replayBlock
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? fontSizeScale(150) : SquareCommentTableViewCell.getHeight()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0.01 : fontSizeScale(5)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let header = UIView(LineBackgroundColor)
            header.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: fontSizeScale(5))
            return header
        }
        return UIView()
    }
}









