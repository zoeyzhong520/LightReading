//
//  TableOfContentsView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 目录页View

class TableOfContentsView: UIView {

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.backgroundColor = TableViewBackgroundColor
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableOfContentsTableViewCell.self, forCellReuseIdentifier: "TableOfContentsTableViewCellID")
        tableView.rowHeight = fontSizeScale(60)
        return tableView
    }()
    
    lazy var tableHeaderView:TableOfContentsTableHeaderView = {
        let tableHeaderView = TableOfContentsTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: fontSizeScale(105)))
        return tableHeaderView
    }()
    
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
        
        self.tableView.tableHeaderView = self.tableHeaderView
    }
}

extension TableOfContentsView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 78
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableOfContentsTableViewCell.createCell(tableView, indexPath: indexPath)
        cell.labelText = "第\(indexPath.row)章"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}







