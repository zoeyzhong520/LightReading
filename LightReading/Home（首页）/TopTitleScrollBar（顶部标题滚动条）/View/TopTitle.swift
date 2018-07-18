//
//  TopTitle.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/18.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class TopTitle: UIView {

    lazy var label:UILabel = {
        let label = UILabel("全部", font: FourthFont, textColor: BlackColor, alignment: .center)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
        return label
    }()
    
    var labelText:String?
    
    var clickBlock:(() -> Void)?
    
    init(frame: CGRect, text:String?) {
        super.init(frame: frame)
        self.labelText = text
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .clear
        
        self.label.text = self.labelText
        self.addSubview(self.label)
        self.label.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func tapAction() {
        if self.clickBlock != nil {
            self.clickBlock!()
        }
    }
}











