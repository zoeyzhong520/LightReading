//
//  SquareWriteViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/21.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: - 广场撰写页

class SquareWriteViewController: BaseViewController {

    lazy var squareWriteView:SquareWriteView = {
        let squareWriteView = SquareWriteView(frame: CGRect(x: 0, y: StatusBarHeight+NavigationBarHeight, width: self.view.bounds.size.width, height: self.view.bounds.size.height-(StatusBarHeight+NavigationBarHeight)))
        return squareWriteView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.addBarButtonItemWithTitle(.right, title: "完成", action: #selector(doneAction))
        
        self.view.addSubview(self.squareWriteView)
    }
    
    //点击事件
    @objc func doneAction() {
        print("点击完成")
        self.dismiss(animated: true, completion: nil)
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
