//
//  MainTabBarViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.createViewControllers()
    }

    func createViewControllers() {
        let homeVC = MainTabBarTool.createViewController(HomeViewController(), title: "首页", image: "home", selectedImage: "")
        let squareVC = MainTabBarTool.createViewController(SquareViewController(), title: "广场", image: "square", selectedImage: "")
        let mineVC = MainTabBarTool.createViewController(MineViewController(), title: "我的", image: "mine", selectedImage: "")
        self.viewControllers = [homeVC, squareVC, mineVC]
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
