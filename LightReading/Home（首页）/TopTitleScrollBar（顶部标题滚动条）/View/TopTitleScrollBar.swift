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
    
    var titlesArray = [String]()
    
    init(frame: CGRect, titlesArray:[String]) {
        super.init(frame: frame)
        self.titlesArray = titlesArray
        self.setScrollViewContentSize()
        self.setLineFrame(0)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.scrollView)
        
        if self.titlesArray.isEmpty == false {
            var contentWidth:CGFloat = 0.0
            
            for i in 0..<self.titlesArray.count {
                let titleViewW = self.titlesArray[i].getTitleWidth(FourthFont) + Margin
                contentWidth += titleViewW
                
                let titleViewH = self.bounds.size.height
                
                let titleView = TopTitle(frame: .zero, text: self.titlesArray[i])
                self.scrollView.addSubview(titleView)
                titleView.clickBlock = { [weak self] in
                    print("i = \(i)")
                    self?.setScrollViewContentOffset(i)
                    self?.setLineFrame(i)
                }
                titleView.snp.makeConstraints({ (make) in
                    make.centerY.equalToSuperview()
                    make.size.equalTo(CGSize(width: titleViewW, height: titleViewH))
                    make.left.equalTo(contentWidth-titleViewW)
                })
            }
        }
        
        self.scrollView.addSubview(self.line)
    }
    
    ///设置scrollView的contentSize
    func setScrollViewContentSize() {
        if self.titlesArray.isEmpty == false {
            var contentWidth:CGFloat = 0.0
            
            for i in 0..<self.titlesArray.count {
                let titleViewW = self.titlesArray[i].getTitleWidth(FourthFont) + Margin
                contentWidth += titleViewW
            }
            self.scrollView.contentSize = CGSize(width: contentWidth, height: self.bounds.size.height)
        }
    }
    
    ///设置scrollView的contentOffset
    func setScrollViewContentOffset(_ index:Int) {
        var contentWidth:CGFloat = 0.0
        var titleViewW:CGFloat = 0.0
        
        for i in 0..<index {
            titleViewW = self.titlesArray[i].getTitleWidth(FourthFont) + Margin
            contentWidth += titleViewW
        }
        self.scrollView.setContentOffset(CGPoint(x: contentWidth-titleViewW, y: 0), animated: true)
    }
    
    ///设置line的frame
    func setLineFrame(_ index:Int) {
        var contentWidth:CGFloat = 0.0
        let titleViewW = self.titlesArray[index].getTitleWidth(FourthFont) + Margin
        
        for i in 0..<index {
            let tmpTitleViewW = self.titlesArray[i].getTitleWidth(FourthFont) + Margin
            contentWidth += tmpTitleViewW
        }
        
        //动画
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.line.frame = CGRect(x: contentWidth, y: self.bounds.size.height-fontSizeScale(2), width: titleViewW, height: fontSizeScale(2))
        }, completion: nil)
    }
}

extension TopTitleScrollBar: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}













