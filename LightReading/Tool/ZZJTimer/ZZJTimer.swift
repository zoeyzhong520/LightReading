//
//  ZZJTimer.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/13.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class ZZJTimer: NSObject {
    
    var timer:Timer!
    
    var timerBlock:(() -> Void)?
    
    ///开启定时器
    func startTimerWithBlock(_ timeInterval:TimeInterval, timerBlock:@escaping (() -> Void)) {
        self.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        RunLoop.main.add(self.timer, forMode: .commonModes)
        self.timerBlock = timerBlock
    }
    
    @objc func timerAction() {
        if self.timerBlock != nil {
            self.timerBlock!()
        }
    }
    
    ///停止定时器
    func stopTimer() {
        guard let timer = self.timer else { return }
        timer.invalidate()
    }
}


























