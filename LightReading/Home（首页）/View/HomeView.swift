//
//  HomeView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    lazy var collectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: fontSizeScale(105), height: fontSizeScale(190))
        flowLayout.headerReferenceSize = CGSize(width: ScreenWidth, height: fontSizeScale(30))
        flowLayout.minimumLineSpacing = fontSizeScale(15)//设置行间距(最小)
        flowLayout.minimumInteritemSpacing = fontSizeScale(15)//设置列间距(最小)
        flowLayout.sectionInset = UIEdgeInsetsMake(fontSizeScale(15), fontSizeScale(15), fontSizeScale(15), fontSizeScale(15))//设置分区缩进量
        
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCellID")
        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header")
        collectionView.register(HomeAdvertisingPageCollectionViewCell.self, forCellWithReuseIdentifier: "HomeAdvertisingPageCollectionViewCellID")
        return collectionView
    }()
    
    var dataArray:Array<String>? {
        didSet {//刷新第一个分组数据
            self.collectionView.reloadItems(at: [IndexPath(item: 0, section: 0)])
        }
    }
    
    var advertisingCellClickBlock:((Int) -> Void)?
    
    var bookCoverClickBlock:(() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = TableViewBackgroundColor
        
        self.addSubview(self.collectionView)
        self.collectionView.reloadData()
    }
}

extension HomeView: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10+1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell = HomeAdvertisingPageCollectionViewCell.createCell(collectionView, indexPath: indexPath)
            cell.dataArray = self.dataArray
            cell.clickBlock = { [weak self] index in
                if self?.advertisingCellClickBlock != nil {
                    self?.advertisingCellClickBlock!(index)
                }
            }
            return cell
        } else {
            let cell = HomeCollectionViewCell.createCell(collectionView, indexPath: indexPath)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        if self.bookCoverClickBlock != nil {
            self.bookCoverClickBlock!()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {//头部视图
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
            headerView.backgroundColor = LightGrayColor
            headerView.alpha = 0.3
            return headerView
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: ScreenWidth, height: fontSizeScale(230))
        } else {
            return CGSize(width: fontSizeScale(105), height: fontSizeScale(190))
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: ScreenWidth, height: fontSizeScale(0))
        } else {
            return CGSize(width: ScreenWidth, height: fontSizeScale(30))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {   
            return UIEdgeInsetsMake(fontSizeScale(15), 0, fontSizeScale(15), 0)
        } else {
            return UIEdgeInsetsMake(fontSizeScale(15), fontSizeScale(15), fontSizeScale(15), fontSizeScale(15))
        }
    }
}










