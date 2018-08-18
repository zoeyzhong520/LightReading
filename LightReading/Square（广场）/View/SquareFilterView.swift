//
//  SquareFilterView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: - 筛选条件选择页

class SquareFilterView: UIView {

    var contentView:UIView?
    
    var contentViewH = fontSizeScale(180)
    
    //rowHeight
    var rowHeight = fontSizeScale(40)
    
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.rowHeight = rowHeight
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var titles = [String]()
    
    init(frame: CGRect, titles:[String]) {
        super.init(frame: frame)
        self.titles = titles
        self.contentViewH = CGFloat(self.titles.count)*rowHeight
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = MongolianlayerColor
        self.frame = SquareFilterViewFrame
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapClickAction)))
        
        if contentView == nil {
            contentView = UIView(.white)
            contentView?.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: contentViewH)
            self.addSubview(contentView!)
            
            self.configContent()
        }
    }
    
    func configContent() {
        
        self.contentView?.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        self.tableView.reloadData()
        
        let topLine = UIView(LineBackgroundColor)
        self.contentView?.addSubview(topLine)
        topLine.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(0.5))
        }
    }
    
    //点击事件
    @objc func tapClickAction() {
        self.disMiss()
    }
    
    //MARK: 显示
    func show() {
        self.alpha = 0.0
        self.contentView?.transform = CGAffineTransform.identity.translatedBy(x: 0, y: -contentViewH)
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 1.0
            self.contentView?.transform = CGAffineTransform.identity
            LRKeyWindow?.addSubview(self)
        }, completion: nil)
    }
    
    //MARK: 隐藏
    func disMiss() {
        self.alpha = 1.0
        self.contentView?.transform = CGAffineTransform.identity.translatedBy(x: 0, y: 0)
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 0.0
            self.contentView?.transform = CGAffineTransform.identity.translatedBy(x: 0, y: -self.contentViewH)
        }) { (finished) in
            self.removeFromSuperview()
        }
    }
}

extension SquareFilterView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}













