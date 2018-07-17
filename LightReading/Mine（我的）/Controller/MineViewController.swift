//
//  MineViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {

    lazy var mineView:MineView = {
        let mineView = MineView(frame: self.view.bounds)
        return mineView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }
    
    func setPage() {
        self.view.addSubview(self.mineView)
        self.mineView.cellClickBlock = { [weak self] cellType in
            switch cellType {
            case .UserInfoType:
                self?.showViewController("PersonalInformationViewController")
            case .DownloadBookType:
                break
            case .CollectionType:
                break
            case .ReadingTraceType:
                break
            case .PointsMallType:
                break
            case .SettingType:
                self?.showViewController("SettingViewController")
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
