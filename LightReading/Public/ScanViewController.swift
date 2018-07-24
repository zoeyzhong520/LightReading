//
//  ScanViewController.swift
//  LightReading
//
//  Created by ZZJ on 2018/7/24.
//  Copyright © 2018年 智富金融. All rights reserved.
//

import UIKit
import AVFoundation

//MARK: 二维码、条形码扫描页

class ScanViewController: BaseViewController {

    ///设备
    lazy var device:AVCaptureDevice = {
        let device = AVCaptureDevice.default(for: .video)
        return device!
    }()
    
    ///输入源
    lazy var input:AVCaptureDeviceInput = {
        let input = try? AVCaptureDeviceInput(device: self.device)
        return input!
    }()
    
    ///输出源
    lazy var output:AVCaptureMetadataOutput = {
        let output = AVCaptureMetadataOutput()
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        return output
    }()
    
    var session:AVCaptureSession!
    
    var preview:AVCaptureVideoPreviewLayer!
    
    var maskLayer:CALayer!
    
    var scanView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setPage()
    }
    
    func setPage() {
        self.title = "二维码/条码"
    }
    
    ///设置扫描二维码
    func setupScanQRCode() {
        // 1、创建设备会话对象，用来设置设备数据输入
        session = AVCaptureSession()
        session.canSetSessionPreset(.high)//高质量采集
        
        if session.canAddInput(self.input) {
            session.addInput(self.input)
        }
        
        if session.canAddOutput(self.output) {
            session.addOutput(self.output)
        }
        
        // 2.设置条码类型为二维码
        self.output.metadataObjectTypes = self.output.availableMetadataObjectTypes
        
        // 3.设置扫描范围
        self.setOutputInterest()
        
        // 4、实时获取摄像头原始数据显示在屏幕上
        preview = AVCaptureVideoPreviewLayer(session: session)
        preview.videoGravity = .resizeAspectFill
        preview.frame = self.view.layer.bounds;
        self.view.layer.backgroundColor = UIColor.black.cgColor
        self.view.layer.insertSublayer(preview, at: 0)
        
        // 5.设置非扫描区域的黑色蒙版图层
        maskLayer = CALayer()
        maskLayer.frame = self.view.layer.bounds
        maskLayer.delegate = self
        self.view.layer.insertSublayer(maskLayer, above: preview)
        maskLayer.setNeedsDisplay()
    }

    ///设置二维码的扫描范围
    func setOutputInterest() {
        let size = self.view.bounds.size
        let scanViewWidth:CGFloat = 240
        let scanViewHeight:CGFloat = 240
        let scanViewX:CGFloat = (size.width - scanViewWidth)/2
        let scanViewY:CGFloat = (size.height - scanViewHeight)/2
        let p1:CGFloat = size.height/size.width
        let p2:CGFloat = 1920.0/1080.0
        
        if p1 < p2 {
            let fixHeight:CGFloat = self.view.bounds.size.width*CGFloat(1920.0/1080.0)
            let fixPadding:CGFloat = (fixHeight-size.height)/2
            output.rectOfInterest = CGRect(x: (scanViewY+fixPadding)/fixHeight, y: scanViewX/size.width, width: scanViewHeight/fixHeight, height: scanViewWidth/size.width)
            
        } else {
            let fixWidth:CGFloat = self.view.bounds.size.height*CGFloat(1080.0/1920.0)
            let fixPadding:CGFloat = (fixWidth-size.width)/2
            output.rectOfInterest = CGRect(x: scanViewY/size.height, y: (scanViewX+fixPadding)/fixWidth, width: scanViewHeight/size.height, height: scanViewWidth/fixWidth)
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

extension ScanViewController: AVCaptureMetadataOutputObjectsDelegate {
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        var stringValue = ""
        
        if metadataObjects.isEmpty == false {
            // 当扫描到数据时，停止扫描
            session.stopRunning()
            
            // 将扫描的线从父控件中移除
            
            
            let metadataObject = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            if let tmpStringValue = metadataObject?.stringValue {
                stringValue = tmpStringValue
            }
            print("stringValue = \(stringValue)")
        }
    }
}

extension ScanViewController: CALayerDelegate {
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
        if layer == self.maskLayer {
            UIGraphicsBeginImageContextWithOptions(self.maskLayer.frame.size, false, 1.0)
            ctx.setFillColor(RGBA(0, 0, 0, 0.6).cgColor)
            ctx.fill(self.maskLayer.frame)
            let scanFrame = self.view.convert(self.scanView.frame, from: self.scanView.superview)
            ctx.clear(scanFrame)
        }
    }
}









