//
//  ViewController.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/07.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CDRTranslucentSideBarDelegate {
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    //お絵描き用のビュー
    let drawView: KMZDrawView = KMZDrawView()
    
    let sideBarView = SideBarView.instance()
    
    //サイドバー
    let sideBar: CDRTranslucentSideBar = CDRTranslucentSideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //サイドバー
        self.sideBar.delegate = self
        self.sideBar.tag = 1;
        self.sideBar.setContentViewInSideBar(sideBarView)
        
        //画像読み込み
        let image = UIImage(named: "bouz")
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        
        print(imageView.frame)
        print(imageContainer.frame)
        
        //描画エリアを作る
        self.drawView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.drawView.backgroundColor = UIColor.clearColor()
        self.imageContainer.addSubview(drawView)
        print(drawView.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func resetButtonTapped(sender: AnyObject) {
        self.drawView.reset()
    }
    @IBAction func getaButtonTapped(sender: AnyObject) {
        self.sideBar.show()
    }
}

