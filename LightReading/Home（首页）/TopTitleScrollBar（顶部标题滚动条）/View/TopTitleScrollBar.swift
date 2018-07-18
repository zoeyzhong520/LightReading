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
        scrollView.backgroundColor = TableViewBackgroundColor
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: ScreenWidth, height: 0)
        return scrollView
    }()
    
    var titlesArray = [String]()
    
    init(frame: CGRect, titlesArray:[String]) {
        super.init(frame: frame)
        self.titlesArray = titlesArray
        self.setScrollViewContentSize()
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.scrollView)
        
        if self.titlesArray.isEmpty == false {
            for i in 0..<self.titlesArray.count {
                let titleViewW = self.titlesArray[i].getTitleWidth(FourthFont)
                print("titleViewW = \(titleViewW)")
                let titleViewH = self.bounds.size.height
                
                let titleView = TopTitle(frame: .zero, text: self.titlesArray[i])
                self.scrollView.addSubview(titleView)
                titleView.snp.makeConstraints({ (make) in
                    make.centerY.equalToSuperview()
                    make.size.equalTo(CGSize(width: titleViewW, height: titleViewH))
                    make.left.equalTo(CGFloat(i)*titleViewW)
                })
            }
        }
    }
    
    ///设置scrollView的contentSize
    func setScrollViewContentSize() {
        if self.titlesArray.isEmpty == false {
            var contentWidth:CGFloat = 0.0
            
            for i in 0..<self.titlesArray.count {
                let titleViewW = self.titlesArray[i].getTitleWidth(FourthFont)
                contentWidth += titleViewW
            }
            self.scrollView.contentSize = CGSize(width: contentWidth, height: 0)
            print("contentSize = \(self.scrollView.contentSize)")
        }
    }
}

extension TopTitleScrollBar: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}













