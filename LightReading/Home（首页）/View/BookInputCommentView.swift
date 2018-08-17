//
//  BookInputCommentView.swift
//  LightReading
//
//  Created by ZZJ on 2018/8/1.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 输入评论页

class BookInputCommentView: UIView {
    
    var contentView:UIView?
    
    fileprivate var contentViewH:CGFloat = fontSizeScale(100)
    
    lazy var textView:UITextView = {
        let textView = UITextView(backgroundColor: LineBackgroundColor, font: FifthFont, textColor: .black, isEditable: true)
        textView.becomeFirstResponder()
        textView.text = UserdefaultsTool.getInputComment(INPUTCOMMENTKEY)
        textView.delegate = self
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
        self.backgroundColor = MongolianlayerColor
        
        self.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
//        self.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
        
        if contentView == nil {
            contentView = UIView(.white)
            contentView?.frame = CGRect(x: 0, y: ScreenHeight-contentViewH, width: ScreenWidth, height: contentViewH)
            self.addSubview(contentView!)
            
            self.configContent()
        }
    }
    
    func configContent() {
        self.registNotification()
        
        self.contentView?.addSubview(self.textView)
        textView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(fontSizeScale(5), fontSizeScale(5), fontSizeScale(5), fontSizeScale(5)))
        }
    }
    
    deinit {
        self.removeNotification()
    }
    
    //MARK: 显示View
    func show() {
        self.alpha = 0.0
        self.contentView?.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: contentViewH)
        
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 1.0
            self.contentView?.frame = CGRect(x: 0, y: ScreenHeight-self.contentViewH, width: ScreenWidth, height: self.contentViewH)
            LRKeyWindow?.addSubview(self)
        }, completion: nil)
    }
    
    //MARK: 移除View
    @objc func disMiss() {
        self.alpha = 1.0
        self.contentView?.frame = CGRect(x: 0, y: ScreenHeight-contentViewH, width: ScreenWidth, height: contentViewH)
        
        UIView.animate(withDuration: AnimateDuration, animations: {
            self.alpha = 0.0
            self.contentView?.frame = CGRect(x: 0, y: ScreenHeight, width: ScreenWidth, height: self.contentViewH)
        }) { (finished) in
            self.removeFromSuperview()
            self.contentView?.removeFromSuperview()
        }
    }
    
    ///处理Tap手势
    @objc func tapAction() {
        self.disMiss()
    }
    
    //MARK: 添加监听
    func registNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: KeyboardWillShow_Notification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: KeyboardWillHide_Notification, object: nil)
    }
    
    @objc func keyboardWillShow(_ noti:Notification) {
        let userInfo = noti.userInfo as! [String:Any]
        let keyBoardBounds = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        var keyBoardBoundsRect = self.convert(keyBoardBounds, to: nil)
        var keyBaoardViewFrame = contentView?.frame
        let deltaY = keyBoardBounds.size.height
        
        let animations:(() -> Void) = {
            self.contentView?.transform = CGAffineTransform.init(translationX: 0, y: -deltaY)
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions.init(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    @objc func keyboardWillHide(_ noti:Notification) {
        let userInfo = noti.userInfo as! [String:Any]
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        let animations:(() -> Void) = {
            self.contentView?.transform = CGAffineTransform.identity
        }
        
        if duration > 0 {
            let options = UIViewAnimationOptions.init(rawValue: UInt((userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber).intValue << 16))
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: animations, completion: nil)
        } else {
            animations()
        }
    }
    
    //移除监听
    func removeNotification() {
        NotificationCenter.default.removeObserver(self)
    }
}

//UITextFieldDelegate
extension BookInputCommentView: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            self.disMiss()
            print("inputText = \(textView.text)")
            //保存输入的评论
            UserdefaultsTool.saveInputComment(textView.text, key: INPUTCOMMENTKEY)
            return false
        }
        return true
    }
}











