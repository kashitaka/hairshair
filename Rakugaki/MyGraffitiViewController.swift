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
    @IBAction func delButtonTapped(sender: AnyObject) {
        
        // Alertの表示
        let actionSheet:UIAlertController = UIAlertController(title:"このらくがきを削除します",
            message: "",
            preferredStyle: UIAlertControllerStyle.ActionSheet
        )
        // キャンセルボタンの定義
        let cancelAction:UIAlertAction = UIAlertAction(title: "キャンセル",
            style: UIAlertActionStyle.Cancel,
            handler:{
                (action:UIAlertAction!) -> Void in
        })
        // 削除ボタンの定義
        let destructiveAction:UIAlertAction = UIAlertAction(title: "削除",
            style: UIAlertActionStyle.Destructive,
            handler:{
                (action:UIAlertAction!) -> Void in
                
                // 削除ボタン押下時の処理
                UIView.animateWithDuration(0.3, animations: {
                    self.myGraffitiImageView.alpha = 0
                    }) { (value: Bool) -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                }
                // 画像の削除処理
                Drawings.shareInstance?.remove([self.drawingkey])
            })
        // ボタンをアラートに追加
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(destructiveAction)
        
        // Alert表示
        presentViewController(actionSheet, animated: true, completion: nil)
    }
}
