//
//  StartMenuViewController.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/23.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit

class StartMenuViewController: UIViewController {

    @IBOutlet weak var bouzImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.duration = 2
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = self.view.center.y * 0.5
        animation.toValue = self.view.center.y * 0.6
        bouzImage.layer.addAnimation(animation, forKey: "animation")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
