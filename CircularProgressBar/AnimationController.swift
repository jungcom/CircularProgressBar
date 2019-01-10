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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLabels()
        setupStackView()
        
        //Add Gesture Recognizer
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }
    
    func setupLabels(){
        titleLabel.text = "Welcome to Anthony Lee's Project"
        titleLabel.font = UIFont(name: "Futura", size: 34)
        titleLabel.numberOfLines = 0
        
        bodyLabel.text = "This application makes use of animations"
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
        
        //ANIMATION CODE !!!
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.titleLabel.alpha = 0
                self.titleLabel.transform = CGAffineTransform(translationX: -30, y: -300)
            }) { (_) in
                
            }
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 2, initialSpringVelocity: 2, options: .curveEaseInOut, animations: {
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: -300)
            }) { (_) in
                
            }
        }
    }
}
