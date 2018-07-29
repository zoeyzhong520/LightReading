//
//  BookDetailViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/23.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 书籍详情页

class BookDetailViewController: BaseViewController {

    lazy var bookDetailView:BookDetailView = {
        let bookDetailView = BookDetailView(frame: self.view.bounds)
        return bookDetailView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.title = "千与千寻"
        
        self.view.addSubview(self.bookDetailView)
        self.bookDetailView.clickBlock = { [weak self] clickType in
            var str = "加入收藏"
            
            switch clickType {
            case .Collect:
                str = "加入收藏"
                SVProgressHUD.showSuccess(withStatus: "收藏成功")
            case .Comment:
                str = "点击评论"
            case .Download:
                str = "离线全本"
                SVProgressHUD.showSuccess(withStatus: "离线全本")
            case .StartReading:
                str = "开始阅读"
                self?.openBook("最寒冷的冬天-美国人眼中的朝鲜战争(节选) - 大卫·哈伯斯塔姆")
            case .TableOfContents:
                str = "目录"
                self?.showViewController("TableOfContentsViewController")
            }
            
            print("clickType = \(str)")
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
