//
//  UIImageView+Extension.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/13.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UIImageView {
    
    convenience init(_ image:String?=nil, backgroundColor:UIColor?=nil, makesToBounds:Bool?=nil, cornerRadius:CGFloat?=nil, borderWidth:CGFloat?=nil, borderColor:UIColor?=nil) {
        self.init()
        
        if let image = image {
            self.image = UIImage(named: image)
        }
        
        self.backgroundColor = backgroundColor
        
        if let makesToBounds = makesToBounds {
            self.layer.masksToBounds = makesToBounds
        }
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
        
        if let borderWidth = borderWidth {
            self.layer.borderWidth = borderWidth
        }
        
        self.layer.borderColor = borderColor?.cgColor
    }
}
