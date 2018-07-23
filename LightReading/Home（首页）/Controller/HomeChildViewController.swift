//
//  HomeChildViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/20.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 带广告页的子控制器

class HomeChildViewController: BaseViewController {

    lazy var homeView:HomeView = {
        let homeView = HomeView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: self.view.bounds.size.height - StatusBarHeight - NavigationBarHeight - TabBarHeight - fontSizeScale(30)))
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.view.addSubview(self.homeView)
        self.homeView.dataArray = [FirstImageUrl, SecondImageUrl, ThirdImageUrl, FourthImageUrl]
        self.homeView.advertisingCellClickBlock = { [weak self] index in
            print("index = \(index)")
            NotificationCenter.default.post(name: HomeChildViewAdvertisingClickBlock_Notification, object: nil)
        }
        
        self.homeView.bookCoverClickBlock = { [weak self] in
            print("点击书籍")
            NotificationCenter.default.post(name: HomeChildViewBookCoverClickBlock_Notification, object: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        NotificationCenter.default.post(name: HomeChildViewWillAppear_Notification, object: nil)
//        print("HomeChildViewWillAppear_Notification")
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        NotificationCenter.default.post(name: HomeChildViewWillDisappear_Notification, object: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


