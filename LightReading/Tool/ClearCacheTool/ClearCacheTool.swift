//
//  ClearCacheTool.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/18.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class ClearCacheTool: NSObject {

    ///计算缓存
    class func checkCacheSize() -> Double {
        var fileSize = SDImageCache.shared().getSize()
        let myCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last
        do {
            let fileInfo = try FileManager.default.attributesOfItem(atPath: myCachePath ?? "")
            if let tmpFileSize = fileInfo[.size] as? UInt {
                fileSize += tmpFileSize
            }
        } catch let error {
            print("error = \(error.localizedDescription)")
        }
        print("fileSize = \(fileSize)")
        return Double(fileSize) / 1024.0 / 1024.0
    }
    
    ///清除缓存
    class func clearCacheSize() {
        SDImageCache.shared().clearDisk {
            DispatchQueue.global().async {
                do {
                    let cachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last ?? ""
                    try FileManager.default.removeItem(atPath: cachePath)
                    
                    DispatchQueue.main.async {
                        SVProgressHUD.showSuccess(withStatus: "清除成功")
                    }
                    
                } catch let error {
                    print("error = \(error.localizedDescription)")
                    DispatchQueue.main.async {
                        SVProgressHUD.showError(withStatus: "清除失败")
                    }
                }
            }
        }
    }
}






