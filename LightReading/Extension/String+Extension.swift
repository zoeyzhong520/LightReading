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
}
