//
//  PersonalAvatarViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/14.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class PersonalAvatarViewController: BaseViewController {
    
    lazy var personalAvatarView:PersonalAvatarView = {
        let personalAvatarView = PersonalAvatarView(frame: self.view.bounds)
        return personalAvatarView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.title = "个人头像"
        
        self.addBarButtonItemWithImage(.right, image: "detailItemImg.jpg", action: #selector(clickAction))
        
        self.view.addSubview(self.personalAvatarView)
        self.personalAvatarView.imgUrl = AvatarImageUrl
    }
    
    @objc func clickAction() {
        LRAlertView.createLRAlertView(["保存图片"]) { [weak self] (clickIndex) in
            PersonalAvatarTool.saveImageToPhotoLibrary(self?.personalAvatarView.imgView.image)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
