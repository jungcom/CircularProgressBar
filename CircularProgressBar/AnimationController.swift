//
//  AnimationController.swift
//  CircularProgressBar
//
//  Created by Anthony Lee on 1/10/19.
//  Copyright © 2019 anthonyLee. All rights reserved.
//

import UIKit

class AnimationController : UIViewController{
    
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    var stackView : UIStackView!
    var titleText = [
        "Welcome to Anthony Lee's Project",
        "With the UIView.animate() method,",
        "The first part used CABasicAnimation",
        "Afterwards, the downloading matches the strokepath",
        "This part will keep repeating its animation"
    ]
    
    var bodyText = [
        "This application makes use of animations",
        "The fluid animations are possible",
        "By adding the animation to the CAShapeLayer, I could recreate a pulsating view",
        "Thus, giving the user a sense of downloading",
        "Anthony Lee"
    ]
    
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLabels()
        setupStackView()
        
        //Add Gesture Recognizer
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func setupLabels(){
        titleLabel.text = titleText[counter]
        titleLabel.font = UIFont(name: "Futura", size: 34)
        titleLabel.numberOfLines = 0
        
        bodyLabel.text = bodyText[counter]
        bodyLabel.numberOfLines = 0
    }
    
    func setupStackView(){
        stackView = UIStackView(arrangedSubviews: [titleLabel, bodyLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        
        //Constraints
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
    }
    
    @objc func handleTap(){
        if counter < (titleText.count - 1) {
            counter += 1
        }
        //ANIMATION CODE !!!
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: -30, y: -300)
            }) { (_) in
                UIView.animate(withDuration: 1.5, delay: 1, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.titleLabel.alpha = 1
                    self.titleLabel.text = self.titleText[self.counter]
                    self.titleLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                }) { (_) in
                    
                }
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: -300)
            }) { (_) in
                UIView.animate(withDuration: 1.5, delay: 1, usingSpringWithDamping: 2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    self.bodyLabel.alpha = 1
                    self.bodyLabel.text = self.bodyText[self.counter]
                    self.bodyLabel.transform = CGAffineTransform(translationX: 0, y: 0)
                }) { (_) in
                    
                }
            }
        }
        
        
    }
}
