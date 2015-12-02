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
    
    //MARK: - IBOutlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var brushWidthTesterContainer: UIView!
    @IBOutlet weak var brushWidthLabel: UILabel!    
    @IBOutlet weak var currentColorView: UIView!
    @IBOutlet weak var colorView01: UIView!
    @IBOutlet weak var colorView02: UIView!
    @IBOutlet weak var colorView03: UIView!
    @IBOutlet weak var colorView04: UIView!
    @IBOutlet weak var colorView05: UIView!
    @IBOutlet weak var shareButton: UIButton!
    
    
    weak var delegate: SideBarViewDelegate! = nil
    
    //MARK: - UIActions
    @IBAction func sliderChanged(sender: AnyObject) {
        delegate?.sliderChanged(slider)
    }
    @IBAction func colorView01ButtonTapped(sender: UIButton) {
        delegate?.colorView01ButtonTapped(sender)
    }
    @IBAction func colorView02ButtonTapped(sender: UIButton) {
        delegate?.colorView02ButtonTapped(sender)
    }
    @IBAction func colorView03ButtonTapped(sender: UIButton) {
        delegate?.colorView03ButtonTapped(sender)
    }
    @IBAction func colorView04Tapped(sender: UIButton) {
        delegate?.colorView04ButtonTapped(sender)
    }
    @IBAction func colorView05Tapped(sender: UIButton) {
        delegate?.colorView05ButtonTapped(sender)
    }
    @IBAction func shareButtonTapped(sender: UIButton) {
        delegate?.shareButtonTapped(sender)
    }
}

protocol SideBarViewDelegate: class {
    func sliderChanged(slider:UISlider)
    func shareButtonTapped(sender:UIButton)
    func colorView01ButtonTapped(sender: UIButton)
    func colorView02ButtonTapped(sender: UIButton)
    func colorView03ButtonTapped(sender: UIButton)
    func colorView04ButtonTapped(sender: UIButton)
    func colorView05ButtonTapped(sender: UIButton)
}
