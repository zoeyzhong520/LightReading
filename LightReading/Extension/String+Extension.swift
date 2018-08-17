//
//  String+Extension.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/12.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

extension String {
    
    ///去除空格
    func removeSpaces() {
        (self as NSString).replacingOccurrences(of: " ", with: "")
    }
    
    func getTitleWidth(_ font:UIFont) -> CGFloat {
        let titleWidth = (self as NSString).size(withAttributes: [NSAttributedStringKey.font:font]).width
        return titleWidth
    }
    
    ///计算字符串尺寸
    func sizeAttributes(_ width:CGFloat, height:CGFloat, font:UIFont) -> CGSize {
        let size = (self as NSString).boundingRect(with: CGSize(width: width, height: height), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font:font], context: nil).size
        return size
    }
    
    ///计算单行字符串尺寸
    func sizeArrtibutes(_ font:UIFont) -> CGSize {
        let size = (self as NSString).size(withAttributes: [NSAttributedStringKey.font:font])
        return size
    }
}




