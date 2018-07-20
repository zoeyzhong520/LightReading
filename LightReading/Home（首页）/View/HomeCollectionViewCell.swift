//
//  HomeCollectionViewCell.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/20.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    lazy var imgView:UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .white
        return imgView
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
        
        self.addSubview(self.imgView)
        self.imgView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    ///创建cell
    class func createCell(_ collectionView:UICollectionView, indexPath:IndexPath) -> HomeCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCellID", for: indexPath) as? HomeCollectionViewCell
        if cell == nil {
            print("创建cell失败")
        }
        return cell!
    }
}





