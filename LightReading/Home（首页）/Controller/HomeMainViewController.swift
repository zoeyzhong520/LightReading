//
//  HomeMainViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/22.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 子控制器

class HomeMainViewController: BaseViewController {

    lazy var homeMainView:HomeMainView = {
        let homeMainView = HomeMainView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: self.view.bounds.size.height - StatusBarHeight - NavigationBarHeight - TabBarHeight - fontSizeScale(30)))
        return homeMainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.view.addSubview(self.homeMainView)
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
