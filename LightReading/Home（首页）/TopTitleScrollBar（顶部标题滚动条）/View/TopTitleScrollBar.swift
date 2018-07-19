//
//  TopTitleScrollBar.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/18.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class TopTitleScrollBar: UIView {

    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: ScreenWidth, height: self.bounds.size.height)
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    ///下划线
    lazy var line:UIView = {
        let line = UIView(BlueColor)
        return line
    }()
    
    var Margin = fontSizeScale(10)
    
    ///标题数组
    var titlesArray:Array<String>? {
        didSet {
            self.setupTopTitle()
            self.setupTopTitleTextFont(0)
            self.setScrollViewContentSize()
            self.setLineFrame(0)
        }
    }
    
    weak var delegate:TopTitleScrollBarDelegate?
    
    ///当前index
    var currentIndex:Int? {
        didSet {
            self.configCurrentIndex()
        }
    }
    
    ///存放TopTitle的数组
    var TopTitleArray = [TopTitle]()
    
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
        
        self.scrollView.addSubview(self.line)
    }
    
    ///创建TopTitle
    func setupTopTitle() {
        if self.titlesArray?.isEmpty == false {
            var contentWidth:CGFloat = 0.0
            
            for i in 0..<(self.titlesArray?.count)! {
                let titleViewW = self.titlesArray![i].getTitleWidth(FourthFont) + Margin
                contentWidth += titleViewW
                
                let titleViewH = self.bounds.size.height
                
                let titleView = TopTitle(frame: .zero, text: self.titlesArray?[i])
                titleView.tag = i
                self.scrollView.addSubview(titleView)
                titleView.clickBlock = { [weak self] in
                    self?.setScrollViewContentOffset(i)
                    self?.setLineFrame(i)
                    self?.configDelegate(i)
                    self?.setupTopTitleTextFont(i)
                }
                titleView.snp.makeConstraints({ (make) in
                    make.centerY.equalToSuperview()
                    make.size.equalTo(CGSize(width: titleViewW, height: titleViewH))
                    make.left.equalTo(contentWidth-titleViewW)
                })
                
                self.TopTitleArray.append(titleView)
            }
        }
    }
    
    ///设置TopTitle的字体、颜色
    func setupTopTitleTextFont(_ index:Int) {
        if self.TopTitleArray.isEmpty == false {
            for topTitle in self.TopTitleArray {
                if topTitle.tag == index {//添加动画
                    topTitle.font = FifthFont
                    topTitle.textColor = LightGrayColor
                    UIView.animate(withDuration: AnimateDuration, animations: {
                        topTitle.font = FourthFont
                        topTitle.textColor = BlueColor
                    }, completion: nil)
                    
                } else {
                    topTitle.font = FourthFont
                    topTitle.textColor = BlueColor
                    UIView.animate(withDuration: AnimateDuration, animations: {
                        topTitle.font = FifthFont
                        topTitle.textColor = LightGrayColor
                    }, completion: nil)
                }
            }
        }
    }
    
    ///设置scrollView的contentSize
    func setScrollViewContentSize() {
        if self.titlesArray?.isEmpty == false {
            var contentWidth:CGFloat = 0.0
            
            for i in 0..<(self.titlesArray?.count)! {
                let titleViewW = self.titlesArray![i].getTitleWidth(FourthFont) + Margin
                contentWidth += titleViewW
                print("titleViewW = \(titleViewW), contentWidth = \(contentWidth)")
            }
            self.scrollView.contentSize = CGSize(width: contentWidth, height: self.bounds.size.height)
        }
    }
    
    ///设置scrollView的contentOffset
    func setScrollViewContentOffset(_ index:Int) {
        if self.titlesArray?.isEmpty == false {
            var contentWidth:CGFloat = 0.0
            var titleViewW:CGFloat = 0.0
            
            for i in 0..<index {
                titleViewW = self.titlesArray![i].getTitleWidth(FourthFont) + Margin
                contentWidth += titleViewW
            }
            self.scrollView.setContentOffset(CGPoint(x: contentWidth/2, y: 0), animated: true)
        }
    }
    
    ///设置line的frame
    func setLineFrame(_ index:Int) {
        if self.titlesArray?.isEmpty == false {
            var contentWidth:CGFloat = 0.0
            let titleViewW = self.titlesArray![index].getTitleWidth(FourthFont) + Margin
            
            for i in 0..<index {
                let tmpTitleViewW = self.titlesArray![i].getTitleWidth(FourthFont) + Margin
                contentWidth += tmpTitleViewW
            }
            
            //动画
            UIView.animate(withDuration: AnimateDuration, animations: {
                self.line.frame = CGRect(x: contentWidth, y: self.bounds.size.height-fontSizeScale(3), width: titleViewW, height: fontSizeScale(3))
            }, completion: nil)
        }
    }
    
    ///代理传值
    func configDelegate(_ index:Int) {
        if self.delegate != nil {
            self.delegate?.didClickTitle(index)
        }
    }
    
    ///设置currentIndex
    func configCurrentIndex() {
        if let index = self.currentIndex {
            self.setScrollViewContentOffset(index)
            self.setLineFrame(index)
            self.setupTopTitleTextFont(index)
        }
    }
}

extension TopTitleScrollBar: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}













