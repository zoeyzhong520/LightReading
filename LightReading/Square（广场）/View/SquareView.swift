//
//  SquareView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareView: UIView {

    lazy var advertisingPageScrollView:AdvertisingPageScrollView = {
        let advertisingPageScrollView = AdvertisingPageScrollView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: fontSizeScale(194)))
        return advertisingPageScrollView
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
        
        self.addSubview(self.advertisingPageScrollView)
    }

}
