//
//  AdvertisingPageScrollView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 广告页

class AdvertisingPageScrollView: UIView {

    //数据源
    var dataArray:Array<String>? {
        didSet {
            self.configDataArray()
        }
    }
    
    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    lazy var pageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = BlueColor
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPage = 0
        pageControl.numberOfPages = 1
        pageControl.backgroundColor = MongolianlayerColor
        return pageControl
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
        
        self.addSubview(self.scrollView)
        
        self.addSubview(self.pageControl)
        self.pageControl.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(20))
        }
    }
    
    func configDataArray() {
        
        //构建subViews
        if self.dataArray?.isEmpty == false {
            
            let cnt = (self.dataArray?.count)!
            print("cnt == \(cnt)")
            
            for i in 0..<cnt {
                let subView = UIImageView()
                subView.sd_setImage(with: URL.init(string: self.dataArray?[i] ?? ""), placeholderImage: UIImage.init(named: "placeholderImage"))
                self.scrollView.addSubview(subView)
                subView.snp.makeConstraints({ (make) in
                    make.top.equalToSuperview()
                    make.size.equalTo(CGSize(width: ScreenWidth, height: self.scrollView.bounds.size.height))
                    make.left.equalTo(CGFloat(i)*ScreenWidth)
                })
            }
            
            //设置scrollView的contentSize
            self.scrollView.contentSize = CGSize(width: ScreenWidth * CGFloat(cnt), height: self.bounds.size.height)
            
            //设置pageControl的numberOfPages
            self.pageControl.numberOfPages = cnt
        }
    }

}

extension AdvertisingPageScrollView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSetX = scrollView.contentOffset.x
        let currentIndex = Int(offSetX/ScreenWidth)
        print("currentIndex == \(currentIndex)")
        self.pageControl.currentPage = currentIndex
    }
    
    
}










