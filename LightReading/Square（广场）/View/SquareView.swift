//
//  SquareView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareView: UIView {

    lazy var advertisingPageScrollView:AdvertisingPageScrollView = {
        let advertisingPageScrollView = AdvertisingPageScrollView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: fontSizeScale(194)))
        return advertisingPageScrollView
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.separatorStyle = .none
        tableView.rowHeight = fontSizeScale(150)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SquareTableViewCell.self, forCellReuseIdentifier: "SquareTableViewCellID")
        return tableView
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
        
//        self.addSubview(self.advertisingPageScrollView)
        
        self.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.tableView.reloadData()
    }

}

extension SquareView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SquareTableViewCell.createCell(tableView, indexPath: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}



