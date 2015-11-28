//
//  MyGraffitiViewController.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/28.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit

class MyGraffitiViewController: UIViewController {
    
    var drawingkey: String = ""
    @IBOutlet weak var myGraffitiImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myGraffitiImageView.image = Drawings.shareInstance?.image(drawingkey)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(sender: UIBarButtonItem) {
        // 前画面に戻る
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
}
