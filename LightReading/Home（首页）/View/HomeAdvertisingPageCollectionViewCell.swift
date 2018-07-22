//
//  HomeAdvertisingPageCollectionViewCell.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/20.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 首页广告页

class HomeAdvertisingPageCollectionViewCell: UICollectionViewCell {
    
    lazy var advertisingPageScrollView:AdvertisingPageScrollView = {
        let advertisingPageScrollView = AdvertisingPageScrollView(frame: self.bounds)
        return advertisingPageScrollView
    }()
    
    var dataArray:Array<String>? {
        didSet {
            self.configDataArray()
        }
    }
    
    var clickBlock:((Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.advertisingPageScrollView)
        self.advertisingPageScrollView.clickBlock = { [weak self] index in
            if self?.clickBlock != nil {
                self?.clickBlock!(index)
            }
        }
        
        self.registNotification()
    }
    
    deinit {
        self.removeNotification()
    }
    
    func configDataArray() {
        self.advertisingPageScrollView.dataArray = self.dataArray
    }
    
    ///注册通知
    func registNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(homeChildViewWillAppear), name: HomeChildViewWillAppear_Notification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(homeChildViewWillDisappear), name: HomeChildViewWillDisappear_Notification, object: nil)
    }
    
    @objc func homeChildViewWillAppear() {
        self.advertisingPageScrollView.enableTimer = true
    }
    
    @objc func homeChildViewWillDisappear() {
        self.advertisingPageScrollView.disableTimer = true
    }
    
    ///移除通知
    func removeNotification() {
        NotificationCenter.default.removeObserver(self, name: HomeChildViewWillAppear_Notification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: HomeChildViewWillDisappear_Notification, object: nil)
    }
    
    ///创建cell
    class func createCell(_ collectionView:UICollectionView, indexPath:IndexPath) -> HomeAdvertisingPageCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeAdvertisingPageCollectionViewCellID", for: indexPath) as? HomeAdvertisingPageCollectionViewCell
        if cell == nil {
            print("创建cell失败")
        }
        return cell!
    }
}












