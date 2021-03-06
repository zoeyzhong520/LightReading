//
//  TableOfContentsViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/27.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 目录页

class TableOfContentsViewController: BaseViewController {

    lazy var tableOfContentsView:TableOfContentsView = {
        let tableOfContentsView = TableOfContentsView(frame: self.view.bounds)
        return tableOfContentsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.title = "目录"
        
        self.view.addSubview(self.tableOfContentsView)
        self.tableOfContentsView.clickBlock = { [weak self] in
            self?.openBook("最寒冷的冬天-美国人眼中的朝鲜战争(节选) - 大卫·哈伯斯塔姆")
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
