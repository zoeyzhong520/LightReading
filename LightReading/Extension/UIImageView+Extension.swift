//
//  UIImageView+Extension.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/13.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit
import Photos

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
    
    ///保存图片到相册
    func saveImageToPhotoLibrary(_ image:UIImage) {
        PHPhotoLibrary.shared().performChanges({
            
            if let image = self.image {
                let req = PHAssetChangeRequest.creationRequestForAsset(from: img)
            }
            
        }) { (success, error) in
            print("success = \(success)")
            SVProgressHUD.showInfo(withStatus: success ? "保存成功" : "保存失败")
            
            if let error = error {
                print("error = \(error.localizedDescription)")
            }
        }
    }
}
















