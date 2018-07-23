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
    
    lazy var titleLabel:UILabel = {
        let titleLabel = UILabel.init("千与千寻", font: SixthFont, textColor: BlackColor, alignment: .center)
        titleLabel.numberOfLines = 2
        return titleLabel
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
        
        self.imgView.sd_setImage(with: URL.init(string: BookCoverUrl), placeholderImage: PlaceholderImage)
        self.addSubview(self.imgView)
        self.imgView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, fontSizeScale(30), 0))
        }
        
        self.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.imgView.snp.bottom)
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





