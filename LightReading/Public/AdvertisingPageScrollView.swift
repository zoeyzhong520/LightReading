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
    
    var enableTimer:Bool? {
        didSet {
            self.configTimer()
        }
    }
    
    var disableTimer:Bool? {
        didSet {
            self.invalidateTimer()
        }
    }
    
    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = .white
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.setContentOffset(CGPoint(x: ScreenWidth, y: 0), animated: false)
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
    
    lazy var leftImageView:UIImageView = {
        let leftImageView = UIImageView.init(image: PlaceholderImage)
        leftImageView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: self.bounds.size.height)
        leftImageView.contentMode = .scaleAspectFill
        leftImageView.clipsToBounds = true
        leftImageView.isUserInteractionEnabled = true
        return leftImageView
    }()
    
    lazy var centerImageView:UIImageView = {
        let centerImageView = UIImageView.init(image: PlaceholderImage)
        centerImageView.frame = CGRect(x: ScreenWidth, y: 0, width: ScreenWidth, height: self.bounds.size.height)
        centerImageView.contentMode = .scaleAspectFill
        centerImageView.clipsToBounds = true
        return centerImageView
    }()
    
    lazy var rightImageView:UIImageView = {
        let rightImageView = UIImageView.init(image: PlaceholderImage)
        rightImageView.frame = CGRect(x: ScreenWidth*2, y: 0, width: ScreenWidth, height: self.bounds.size.height)
        rightImageView.contentMode = .scaleAspectFill
        rightImageView.clipsToBounds = true
        return rightImageView
    }()
    
    lazy var timer:ZZJTimer = {
        let timer = ZZJTimer()
        return timer
    }()
    
    var currentImageIndex:Int = 0
    
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
        
        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction(_:))))
        
        self.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.leftImageView)
        self.scrollView.addSubview(self.centerImageView)
        self.scrollView.addSubview(self.rightImageView)
        
        self.addSubview(self.pageControl)
        self.pageControl.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.height.equalTo(fontSizeScale(20))
        }
    }
    
    func configDataArray() {
        if self.dataArray?.isEmpty == false {
            let cnt = (self.dataArray?.count)!
            
            self.leftImageView.sd_setImage(with: URL.init(string: self.dataArray![cnt-1]), placeholderImage: PlaceholderImage)
            self.centerImageView.sd_setImage(with: URL.init(string: self.dataArray![0]), placeholderImage: PlaceholderImage)
            
            if cnt > 1 {
                self.rightImageView.sd_setImage(with: URL.init(string: self.dataArray![1]), placeholderImage: PlaceholderImage)
            }
            
            self.pageControl.numberOfPages = cnt
            self.scrollView.contentSize = CGSize(width: ScreenWidth*CGFloat(cnt), height: 0)
        }
    }
    
    ///configTimer
    func configTimer() {
        if self.enableTimer == true {
            print("定时器开启～")
            self.timer.startTimerWithBlock(3) { [weak self] in
                self?.scrollView.setContentOffset(CGPoint(x: ScreenWidth*2, y: 0), animated: true)
            }
        }
    }
    
    ///invalidateTimer
    func invalidateTimer() {
        if self.disableTimer == true {
            self.timer.stopTimer()
            print("定时器关闭～")
        }
    }
    
    ///重新加载图片
    func reloadImage() {
        if self.dataArray?.isEmpty == false {
            
            let cnt = (self.dataArray?.count)!
            
            var leftImageIndex:Int = 0
            var rightImageIndex:Int = 0
            
            let offSetX:CGFloat = self.scrollView.contentOffset.x
            if offSetX > ScreenWidth {
                self.currentImageIndex = (self.currentImageIndex+1) % cnt
            } else if offSetX < ScreenWidth {
                self.currentImageIndex = (self.currentImageIndex+cnt-1) % cnt
            }
            
            //重新设置图片
            self.centerImageView.sd_setImage(with: URL.init(string: self.dataArray![currentImageIndex]), placeholderImage: PlaceholderImage)
            
            leftImageIndex = (currentImageIndex+cnt-1) % cnt
            rightImageIndex = (currentImageIndex+1) % cnt
            self.leftImageView.sd_setImage(with: URL.init(string: self.dataArray![leftImageIndex]), placeholderImage: PlaceholderImage)
            self.rightImageView.sd_setImage(with: URL.init(string: self.dataArray![rightImageIndex]), placeholderImage: PlaceholderImage)
        }
    }
    
    ///tap Action
    @objc fileprivate func tapAction(_ tap:UITapGestureRecognizer) {
        if self.clickBlock != nil {
            self.clickBlock!(self.currentImageIndex)
        }
    }
}

extension AdvertisingPageScrollView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.reloadImage()
        scrollView.setContentOffset(CGPoint(x: ScreenWidth, y: 0), animated: false)
        self.pageControl.currentPage = self.currentImageIndex
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.timer.stopTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.configTimer()
    }
    
    /*
     setContentOffset:animated:方法执行完毕后不会调用scrollview的scrollViewDidEndDecelerating方法，但是会调用scrollViewDidEndScrollingAnimation方法
     */
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        self.reloadImage()
        scrollView.setContentOffset(CGPoint(x: ScreenWidth, y: 0), animated: false)
        self.pageControl.currentPage = self.currentImageIndex
    }
}










