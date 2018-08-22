//
//  SquareViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: - 广场页

class SquareViewController: BaseViewController {

    lazy var squareView:SquareView = {
        let squareView = SquareView(frame: .zero)
        squareView.clickBlock = { [weak self] in
            print("广场 评论")
            self?.showViewController("SquareCommentViewController", hidesBottomBarWhenPushed: true)
        }
        return squareView
    }()
    
    lazy var headerView:SquareTableHeaderView = {
        let headerView = SquareTableHeaderView(frame: CGRect(x: 0, y: StatusBarHeight+NavigationBarHeight, width: ScreenWidth, height: fontSizeScale(50)))
        headerView.leftDefaultBtn.clickBlock = { [weak self] index in
            print("index = \(index)")
        }
        headerView.rightDefaultBtn.clickBlock = { [weak self] index in
            print("index = \(index)")
        }
        return headerView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        
        self.addBarButtonItemWithImage(.right, image: "writeImg", action: #selector(writeAction))
        
        self.view.addSubview(self.headerView)
        
        self.view.addSubview(self.squareView)
        self.squareView.advertisingPageScrollView.dataArray = [FifthImageUrl, SixthImageUrl, SeventhImageUrl, EighthImageUrl, NinethImageUrl, TenthImageUrl]
        self.squareView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headerView.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    //撰写
    @objc func writeAction() {
        print("撰写")
        self.showViewControllerWithPresent("SquareWriteViewController")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.squareView.advertisingPageScrollView.enableTimer = true//开启定时器
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        self.squareView.advertisingPageScrollView.disableTimer = true //停止定时器
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
