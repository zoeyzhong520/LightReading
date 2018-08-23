//
//  SquareCommentReplayView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/23.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 其他用户对评论的回复

class SquareCommentReplayView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = TableViewBackgroundColor
    }
}











