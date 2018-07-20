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
    }
    
    func configDataArray() {
        self.advertisingPageScrollView.dataArray = self.dataArray
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












