//
//  LRWebViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/22.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit
import WebKit

//MARK: WebViewController

class LRWebViewController: BaseViewController {

    lazy var webView:WKWebView = {
        let webView = WKWebView(frame: self.view.bounds, configuration: WKWebViewConfiguration())
        webView.navigationDelegate = self
        return webView
    }()
    
    ///Url
    var url:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
        self.addObserver()
    }

    func setPage() {
        self.view.addSubview(self.webView)
        
        if let URL = URL.init(string: self.url ?? "") {
            self.webView.load(URLRequest.init(url: URL))
        }
    }
    
    ///添加监听
    func addObserver() {
        self.webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
    
    ///移除监听
    func removeObserver() {
        self.webView.removeObserver(self, forKeyPath: "title")
    }
    
    deinit {
        self.removeObserver()
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

extension LRWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
        SVProgressHUD.show()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        // 当内容开始到达时调用
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载完成")
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("error = \(error.localizedDescription)")
        SVProgressHUD.dismiss()
    }
}

extension LRWebViewController {
    
    //WkWebView的 回调
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "title" {
            if let object = object as? WKWebView {
                if object == self.webView {
                    self.title = self.webView.title
                    print("title = \(self.webView.title ?? "")")
                } else {
                    super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
                }
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
}













