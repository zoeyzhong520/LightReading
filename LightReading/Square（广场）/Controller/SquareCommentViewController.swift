//
//  SquareCommentViewController.swift
//  LightReading
//
//  Created by zhifu360 on 2018/8/22.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit

//MARK: 广场 评论页

class SquareCommentViewController: BaseViewController {

    lazy var squareCommentView:SquareCommentView = {
        let squareCommentView = SquareCommentView(frame: self.view.bounds)
        squareCommentView.replayBlock = { [weak self] in
            print("回复Ta")
            self?.addCommentView()
        }
        return squareCommentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }

    func setPage() {
        self.title = "评论"
        
        self.view.addSubview(self.squareCommentView)
    }
    
    func addCommentView() {
        let commentView = BookInputCommentView(frame: .zero)
        commentView.show()
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
