//
//  PersonalAvatarView.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/15.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class PersonalAvatarView: UIView {
    
    var imgUrl:String? {
        didSet {
            self.configImgUrl()
        }
    }
    
    lazy var scrollView:UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.backgroundColor = BlackColor
        scrollView.contentSize = CGSize(width: ScreenWidth, height: ScreenHeight)
        scrollView.delegate = self
        scrollView.maximumZoomScale = 2.0//设置最大缩放倍数
        scrollView.minimumZoomScale = 0.5//设置最小缩放倍数
        return scrollView
    }()
    
    lazy var imgView:UIImageView = {
        let imgView = UIImageView(frame: self.bounds)
        imgView.contentMode = .scaleAspectFit
        imgView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(tapAction(_:)))
        tapGesture.numberOfTapsRequired = 2//添加双击手势
        imgView.addGestureRecognizer(tapGesture)
        
        let longPressgesture = UILongPressGestureRecognizer.init(target: self, action: #selector(imgViewLongPressAction(_:)))
        imgView.addGestureRecognizer(longPressgesture)
        tapGesture.require(toFail: longPressgesture)
        return imgView
    }()
    
    var zoomOut_In = true //控制点击图片放大或缩小
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        self.backgroundColor = .white
        
        self.addSubview(self.scrollView)
        
        self.scrollView.addSubview(self.imgView)
    }
    
    @objc func tapAction(_ gesture:UITapGestureRecognizer) {
        var newRect:CGFloat = 0.0
        if zoomOut_In {
            newRect = 2*1.5
            zoomOut_In = false
        } else {
            newRect = 1.0
            zoomOut_In = true
        }
        
        let zoomRect = self.zoomRectForScale(newRect, center: gesture.location(in: gesture.view))
        self.scrollView.zoom(to: zoomRect, animated: true)
    }
    
    func zoomRectForScale(_ scale:CGFloat, center:CGPoint) -> CGRect {
        
        var zoomRect = CGRect.zero
        zoomRect.size.height = self.scrollView.frame.size.height / scale
        zoomRect.size.width = self.scrollView.frame.size.width / scale
        
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2)
        return zoomRect
    }
    
    func configImgUrl() {
        if let imgUrl = self.imgUrl {
            self.imgView.sd_setImage(with: URL.init(string: imgUrl), placeholderImage: PlaceholderImage)
        }
    }
    
    @objc func imgViewLongPressAction(_ gesture:UIGestureRecognizer) {
        if gesture.state == .began {
            LRAlertView.createLRAlertView(["保存图片"]) { [weak self] (clickIndex) in
                self?.imgView.saveImageToPhotoLibrary()
            }
        }
    }
}

extension PersonalAvatarView: UIScrollViewDelegate {
    
    //当UIScrollView尝试进行缩放的时候调用
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imgView
    }
    
    //当缩放完毕的时候调用
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        
    }
    
    //当正在缩放的时候调用
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        
    }
}










