//
//  ViewController.swift
//  CircularProgressBar
//
//  Created by Anthony Lee on 1/4/19.
//  Copyright © 2019 anthonyLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -(CGFloat.pi/2), endAngle: CGFloat.pi*2, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.strokeEnd = 0
        
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    
    @objc private func handleTap(){
        print("hl")
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.isRemovedOnCompletion = false
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        shapeLayer.add(basicAnimation, forKey: "basic")
    }


}

