//
//  PersonalInformationViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/13.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 个人信息

class PersonalInformationViewController: BaseViewController {

    lazy var personalInformationView:PersonalInformationView = {
        let personalInformationView = PersonalInformationView(frame: self.view.bounds)
        return personalInformationView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.title = "个人信息"
        
        self.view.addSubview(self.personalInformationView)
        self.personalInformationView.cellClickBlock = { [weak self] cellType in
            switch cellType {
            case .AvatarType:
                self?.showViewController("PersonalAvatarViewController", hidesBottomBarWhenPushed: true)
            default:
                break
            }
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
