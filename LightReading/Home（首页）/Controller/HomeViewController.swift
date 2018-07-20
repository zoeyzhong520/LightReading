//
//  HomeViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 首页

class HomeViewController: BaseViewController {
    
    lazy var topTitleMainView:TopTitleMainView = {
        let topTitleMainView = TopTitleMainView(frame: CGRect(x: 0, y: StatusBarHeight+NavigationBarHeight, width: ScreenWidth, height: self.view.bounds.size.height - StatusBarHeight - NavigationBarHeight - TabBarHeight))
        topTitleMainView.delegate = self
        return topTitleMainView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setPage()
    }
    
    func setPage() {
        
        self.addBarButtonItemWithImage(.right, image: "saoyisao", action: #selector(clickAction))
        
        self.view.addSubview(self.topTitleMainView)
    }
    
    @objc func clickAction() {
        print("扫一扫")
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

extension HomeViewController: TopTitleMainViewDelegate {
    
    func titlesForTopTitleView() -> [String]? {
        return [
            "全部",
            "中文经典",
            "古诗鉴赏",
            "阶梯阅读",
            "儿童文学",
            "文学名著",
            "国学名著",
            "自然科普",
            "人文社科",
            "成长励志"
        ]
    }
    
    func viewControllersForTopTitleView() -> [UIViewController]? {
        return [
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController(),
            HomeChildViewController()
        ]
    }
}










