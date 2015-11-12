//
//  SideBarView.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/11.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit

class SideBarView: UIView {
    class func instance() -> SideBarView {
        return UINib(nibName: "SideBarView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! SideBarView
    }
    
    @IBOutlet weak var slider: UISlider!
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func sliderChanged(sender: AnyObject) {
        
    }

}
