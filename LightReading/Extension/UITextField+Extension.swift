//
//  UITextField+Extension.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension UITextField {
    
    convenience init(_ placeholder: String?=nil, backgroundColor: UIColor?=nil, font: UIFont?=nil, makesToBounds:Bool?=nil, cornerRadius:CGFloat?=nil, borderWidth:CGFloat?=nil, borderColor:UIColor?=nil) {
        self.init()
        
        self.placeholder = placeholder
        self.backgroundColor = backgroundColor
        self.font = font
        
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
    
    ///添加一个左边图片
    func addLeftImageView(_ image:String) {
        
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        
        let imageView = UIImageView.init(image: UIImage.init(named: image))
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        view.addSubview(imageView)
        
        self.leftView = view
        self.leftViewMode = .always
    }
}













