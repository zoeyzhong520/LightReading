//
//  TopTitleMainView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/18.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class TopTitleMainView: UIView {

    lazy fileprivate var topTitleScrollBar:TopTitleScrollBar = {
        let frame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: fontSizeScale(30))
        let topTitleScrollBar = TopTitleScrollBar(frame: frame)
        topTitleScrollBar.delegate = self
        return topTitleScrollBar
    }()
    
    fileprivate var titlesArray:Array<String>? {
        didSet {
            self.topTitleScrollBar.titlesArray = titlesArray
        }
    }
    
    ///子视图数组
    fileprivate var subViewsArray:Array<UIView>? {
        didSet {
            self.setupSubViews()
            self.setScrollViewContentSize()
        }
    }
    
    ///子控制器数组
    fileprivate var subViewControllersArray:Array<UIViewController>? {
        didSet {
            self.setupSubViewControllers()
            self.setScrollViewContentSizeWithSubViewControllers()
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
    
    weak var delegate:TopTitleMainViewDelegate? {
        didSet {
            self.configDelegate()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.topTitleScrollBar)
        
        self.addSubview(self.scrollView)
    }
    
    ///设置subViews
    fileprivate func setupSubViews() {
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
    
    ///设置subViewControllers
    fileprivate func setupSubViewControllers() {
        if self.subViewControllersArray?.isEmpty == false {
            for i in 0..<(self.subViewControllersArray?.count)! {
                let subView = self.subViewControllersArray![i].view
                subView?.backgroundColor = i % 2 == 0 ? UIColor.magenta : UIColor.brown
                self.scrollView.addSubview(subView!)
                subView?.snp.makeConstraints({ (make) in
                    make.left.equalTo(ScreenWidth*CGFloat(i))
                    make.size.equalTo(CGSize(width: ScreenWidth, height: self.bounds.size.height-fontSizeScale(30)))
                    make.top.equalToSuperview()
                })
            }
        }
    }
    
    ///设置scrollView的contentSize
    fileprivate func setScrollViewContentSize() {
        if self.subViewsArray?.isEmpty == false {
            let cnt = (self.subViewsArray?.count)!
            self.scrollView.contentSize = CGSize(width: ScreenWidth*CGFloat(cnt), height: self.bounds.size.height-fontSizeScale(30))
        }
    }
    
    ///设置scrollView的contentSize
    fileprivate func setScrollViewContentSizeWithSubViewControllers() {
        if self.subViewControllersArray?.isEmpty == false {
            let cnt = (self.subViewControllersArray?.count)!
            self.scrollView.contentSize = CGSize(width: ScreenWidth*CGFloat(cnt), height: self.bounds.size.height-fontSizeScale(30))
        }
    }
    
    ///设置scrollView的contentOffset
    fileprivate func setScrollViewContentOffset(_ index:Int) {
        self.scrollView.setContentOffset(CGPoint(x: ScreenWidth*CGFloat(index), y: 0), animated: true)
    }
    
    ///设置delegate
    fileprivate func configDelegate() {
        if self.delegate != nil {
            self.titlesArray = self.delegate?.titlesForTopTitleView()
            self.subViewControllersArray = self.delegate?.viewControllersForTopTitleView()
        }
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













