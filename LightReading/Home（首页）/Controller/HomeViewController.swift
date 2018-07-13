//
//  HomeViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    lazy var homeView:HomeView = {
        let homeView = HomeView(frame: CGRect(x: 0, y: StatusBarHeight+NavigationBarHeight, width: ScreenWidth, height: self.view.bounds.size.height - StatusBarHeight - NavigationBarHeight - TabBarHeight))
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        
        self.addBarButtonItemWithImage(.right, image: "saoyisao", action: #selector(clickAction))
        
        self.view.addSubview(self.homeView)
        self.homeView.advertisingPageScrollView.dataArray = [FirstImageUrl, SecondImageUrl, ThirdImageUrl, FourthImageUrl]
        
    }
    
    @objc func clickAction() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.homeView.advertisingPageScrollView.enableTimer = true//开启定时器
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.homeView.advertisingPageScrollView.disableTimer = true //停止定时器
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
