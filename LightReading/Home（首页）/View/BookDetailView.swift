//
//  BookDetailView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/23.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class BookDetailView: UIView {

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.backgroundColor = TableViewBackgroundColor
        tableView.sectionHeaderHeight = fontSizeScale(10)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookIntroductionTableViewCell.self, forCellReuseIdentifier: "BookIntroductionTableViewCellID")
        tableView.register(BookTableOfContentsTableViewCell.self, forCellReuseIdentifier: "BookTableOfContentsTableViewCellID")
        tableView.register(BookCommentTableViewCell.self, forCellReuseIdentifier: "BookCommentTableViewCellID")
        tableView.separatorStyle = .none
        return tableView
    }()
    
    ///BookIntroductionTableViewCell的高度值
    var BookIntroductionTableViewCellNewH:CGFloat?
    
    var clickBlock:((Enums.BookDetailCellType) -> Void)?
    
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

extension BookDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = BookIntroductionTableViewCell.createCell(tableView, indexPath: indexPath)
            cell.checkAllIntructionBlock = { [weak self] textH in
                print("textH = \(textH)")
                self?.BookIntroductionTableViewCellNewH = fontSizeScale(260+textH)
                self?.tableView.reloadData()
            }
            cell.clickBlock = { [weak self] clickType in
                if self?.clickBlock != nil {
                    self?.clickBlock!(clickType)
                }
            }
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = BookTableOfContentsTableViewCell.createCell(tableView, indexPath: indexPath)
            return cell
        } else {
            let cell = BookCommentTableViewCell.createCell(tableView, indexPath: indexPath)
            cell.commentBlock = { [weak self] in
                if self?.clickBlock != nil {
                    self?.clickBlock!(Enums.BookDetailCellType.Comment)
                }
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.BookIntroductionTableViewCellNewH != nil ? self.BookIntroductionTableViewCellNewH! : fontSizeScale(300)
        } else if indexPath.section == 1 {
            return fontSizeScale(40)
        } else {
            return fontSizeScale(350)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 || indexPath.section == 2 {
            //不做操作
        } else {//目录
            let cellType = Enums.BookDetailCellType.TableOfContents
            if self.clickBlock != nil {
                self.clickBlock!(cellType)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.0
        }
        return fontSizeScale(10)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(TableViewBackgroundColor)
        return view
    }
}









