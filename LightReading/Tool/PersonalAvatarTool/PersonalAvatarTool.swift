//
//  PersonalAvatarTool.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/17.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class PersonalAvatarTool: NSObject {

    static let instance = PersonalAvatarTool()
    private override init() {}
    
    ///保存图片到相册
    class func saveImageToPhotoLibrary(_ image:UIImage?) {
        if let image = image {
            UIImageWriteToSavedPhotosAlbum(image, instance, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
    }
    
    @objc func image(image: UIImage, didFinishSavingWithError error: NSError, contextInfo:UnsafeRawPointer)       {
        if error.localizedDescription.count <= 0 {
            SVProgressHUD.showInfo(withStatus: "保存图片成功")
        } else {
            SVProgressHUD.showInfo(withStatus: "保存图片失败")
        }
    }
}














