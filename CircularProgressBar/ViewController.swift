//
//  ViewController.swift
//  CircularProgressBar
//
//  Created by Anthony Lee on 1/4/19.
//  Copyright © 2019 anthonyLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    
    let shapeLayer = CAShapeLayer()
    
    let percentageLabel : UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(percentageLabel)
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = view.center
        
        //track Layer
        let trackLayer = CAShapeLayer()
        
        let center = view.center
        let trackPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -(CGFloat.pi/2), endAngle: CGFloat.pi*2, clockwise: true)
        trackLayer.path = trackPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = .round
        trackLayer.fillColor = UIColor.clear.cgColor
        
        view.layer.addSublayer(trackLayer)
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -(CGFloat.pi/2), endAngle: CGFloat.pi*2-(CGFloat.pi/2), clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.strokeEnd = 0
        
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    let urlString = "https://firebasestorage.googleapis.com/v0/b/firestorechat-e64ac.appspot.com/o/intermediate_training_rec.mp4?alt=media&token=e20261d0-7219-49d2-b32d-367e1606500c"
    
    fileprivate func beginDownloading(){
        shapeLayer.strokeEnd = 0
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: operationQueue)
        guard let url = URL(string: urlString) else {
            return
        }
        let task = urlSession.downloadTask(with: url)
        task.resume()
    }
    
    fileprivate func animateCircle() {
        print("animateCircle")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 10
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        shapeLayer.add(basicAnimation, forKey: "basic")
    }
    
    @objc private func handleTap(){
        beginDownloading()
        //animateCircle()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        print(percentage)
        
        DispatchQueue.main.async {
            self.percentageLabel.text = "\(Int(percentage*100))%"
            self.shapeLayer.strokeEnd = CGFloat(percentage)
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }

}

