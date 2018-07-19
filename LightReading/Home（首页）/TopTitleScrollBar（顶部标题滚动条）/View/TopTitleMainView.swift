//
//  TopTitleMainView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/18.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class TopTitleMainView: UIView {

    lazy var topTitleScrollBar:TopTitleScrollBar = {
        let frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: fontSizeScale(30))
        let topTitleScrollBar = TopTitleScrollBar(frame: frame)
        topTitleScrollBar.delegate = self
        return topTitleScrollBar
    }()
    
    var titlesArray:Array<String>? {
        didSet {
            self.topTitleScrollBar.titlesArray = titlesArray
        }
    }
    
    ///子视图数组
    var subViewsArray:Array<UIView>? {
        didSet {
            self.setupSubViews()
            self.setScrollViewContentSize()
        }
    }
    
    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: fontSizeScale(30), width: self.bounds.size.width, height: self.bounds.size.height-fontSizeScale(30)))
        scrollView.backgroundColor = .clear
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: ScreenWidth, height: self.bounds.size.height-fontSizeScale(30))
        return scrollView
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
        
        self.addSubview(self.topTitleScrollBar)
        
        self.addSubview(self.scrollView)
    }
    
    ///设置subViews
    func setupSubViews() {
        if self.subViewsArray?.isEmpty == false {
            for i in 0..<(self.subViewsArray?.count)! {
                let subView = self.subViewsArray![i]
                subView.backgroundColor = i % 2 == 0 ? UIColor.orange : UIColor.cyan
                self.scrollView.addSubview(subView)
                subView.snp.makeConstraints({ (make) in
                    make.left.equalTo(ScreenWidth*CGFloat(i))
                    make.size.equalTo(CGSize(width: ScreenWidth, height: self.bounds.size.height-fontSizeScale(30)))
                    make.top.equalToSuperview()
                })
            }
        }
    }
    
    ///设置scrollView的contentSize
    func setScrollViewContentSize() {
        if self.subViewsArray?.isEmpty == false {
            let cnt = (self.subViewsArray?.count)!
            self.scrollView.contentSize = CGSize(width: ScreenWidth*CGFloat(cnt), height: self.bounds.size.height-fontSizeScale(30))
        }
    }
    
    ///设置scrollView的contentOffset
    func setScrollViewContentOffset(_ index:Int) {
        self.scrollView.setContentOffset(CGPoint(x: ScreenWidth*CGFloat(index), y: 0), animated: true)
    }
}

extension TopTitleMainView: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offSetX = scrollView.contentOffset.x
        let currentIndex = Int(offSetX/ScreenWidth)
        self.topTitleScrollBar.currentIndex = currentIndex//修改当前选中的标题状态
    }
}

extension TopTitleMainView: TopTitleScrollBarDelegate {
    
    func didClickTitle(_ index: Int) {
        self.setScrollViewContentOffset(index)
    }
}













