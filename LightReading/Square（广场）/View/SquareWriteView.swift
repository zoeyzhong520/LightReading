//
//  SquareWriteView.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/21.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class SquareWriteView: UIView {

    lazy var textView:UITextView = {
        let textView = UITextView(backgroundColor: LightGrayColor, font: FifthFont, textColor: .black, isEditable: true)
        textView.delegate = self
        textView.becomeFirstResponder()
        textView.text = UserdefaultsTool.getInputComment(SQUAREINPUTCOMMENTKEY)
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.addSubview(self.textView)
        textView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(fontSizeScale(5), fontSizeScale(5), fontSizeScale(iPhoneX ? 39 : 5), fontSizeScale(5)))
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}

//UITextViewDelegate
extension SquareWriteView: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            print("inputText = \(textView.text)")
            UserdefaultsTool.saveInputComment(textView.text, key: SQUAREINPUTCOMMENTKEY)
            return false
        }
        return true
    }
}










