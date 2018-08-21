//
//  BaseViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/7/11.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 控制器基类

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.configUI()
    }

    func configUI() {
        self.view.backgroundColor = .white
        
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserdefaultsTool.deleteInputComment(INPUTCOMMENTKEY)//删除输入的评论
        NotificationTool.removeNotificationCenter(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationTool.registerApplicationWillTerminate(self, selector: #selector(applicationWillTerminate), object: nil)
    }
    
    @objc func applicationWillTerminate() {
        UserdefaultsTool.deleteInputComment(SQUAREINPUTCOMMENTKEY)
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
