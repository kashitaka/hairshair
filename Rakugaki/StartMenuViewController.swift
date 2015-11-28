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
    var indexForAnimation = Int()
    var timer: NSTimer = NSTimer()
    
    //MARK: - ViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // NSNotificationCenterの設定
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "enterForeground:", name:"applicationWillEnterForeground", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        //bouzのアニメーション
        animateBouz()
        
        indexForAnimation = 0
 
        // 一定間隔で実行
        timer = NSTimer.scheduledTimerWithTimeInterval(0.68, target: self, selector: "changeImageView", userInfo: nil, repeats: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillDisappear(animated: Bool) {
        timer.invalidate()
    }
    
    func enterForeground(notification: NSNotification){
        animateBouz()
    }
    
    func animateBouz() {
        let animation = CABasicAnimation(keyPath: "position.y")
        animation.duration = 2
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animation.fromValue = self.view.center.y * 0.5
        animation.toValue = self.view.center.y * 0.6
        bouzImage.layer.addAnimation(animation, forKey: "animation")
    }
    
    func changeImageView() {
        if let keys = Drawings.shareInstance?.keys(){
            if indexForAnimation >= keys.count{
                indexForAnimation = 0
                bouzImage.image = UIImage(named: "bouzwithshadow")
            } else {
                bouzImage.image = Drawings.shareInstance?.image(keys[indexForAnimation])
                indexForAnimation++
            }
        }
    }
    
}
