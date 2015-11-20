//
//  ViewController.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/07.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit

class DrawingViewController: UIViewController, CDRTranslucentSideBarDelegate, ACEDrawingViewDelegate {
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var undoButton: UIButton!
    @IBOutlet weak var redoButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
        
    //サイドバーの中に表示するビュー
    let sideBarView = SideBarView.instance()
    
    //お絵かきビュー
    @IBOutlet weak var drawingView: ACEDrawingView!
    
    //サイドバー
    let sideBar: CDRTranslucentSideBar = CDRTranslucentSideBar()
    
    //筆の太さを可視化するビューその名もbrush Tester
    let brushTester = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //サイドバー中身のビューをデリゲート
        sideBarView.delegate = self
        drawingView.delegate = self
        
        //サイドバーの設定
        self.sideBar.delegate = self
        self.sideBar.translucentTintColor = UIColor.grayColor()
        self.sideBar.translucentAlpha = 0.6
        self.sideBar.tag = 1;
        self.sideBar.setContentViewInSideBar(sideBarView)
        
        //画像読み込み
        let image = UIImage(named: "bouz")
        imageView.contentMode = .ScaleAspectFit
        imageView.image = image
        
        //描画エリアを設定
        self.drawingView.frame.size = self.view.frame.size
        self.drawingView.center = self.view.center
        
        // sideBarViewの設定
        // 現在の筆の太さの外側のビューを設定
        self.sideBarView.brushWidthTesterContainer.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.sideBarView.brushWidthTesterContainer.layer.borderWidth = 1
        self.sideBarView.brushWidthTesterContainer.layer.cornerRadius = 20
        updateSideBarView()
        // 現在の筆の太さのビューを設定
        self.brushTester.layer.borderWidth = 1
        self.brushTester.layer.borderColor = UIColor.darkGrayColor().CGColor
        // 現在の色を表示する部分の設定
        self.sideBarView.currentColorView.layer.cornerRadius = 3
        self.sideBarView.currentColorView.layer.borderWidth = 1
        self.sideBarView.currentColorView.layer.borderColor = UIColor.darkGrayColor().CGColor
        self.sideBarView.addSubview(brushTester)
        updateSideBarViewColors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // SideBarViewの中身を更新する
    func updateSideBarView() {
        
        //brashTester設定
        self.brushTester.frame.size = CGSize(width: drawingView.lineWidth, height: drawingView.lineWidth)
        self.brushTester.center = sideBarView.brushWidthTesterContainer.center
        self.brushTester.backgroundColor = drawingView.lineColor
        self.brushTester.layer.cornerRadius = drawingView.lineWidth / 2
        
        //brushWidthLabelに筆の太さを表示
        self.sideBarView.brushWidthLabel.text = ("\(String(Int(drawingView.lineWidth)))pt")
    }
    // SideBarViewの色を更新する
    func updateSideBarViewColors(){
        self.brushTester.backgroundColor = drawingView.lineColor
        self.sideBarView.currentColorView.backgroundColor = drawingView.lineColor
    }
    
    // MARK: - IBAction
    // リセットボタン
    @IBAction func resetButtonTapped(sender: AnyObject) {
        //描画済みの線があるときのみ動作する
        if self.drawingView.canUndo(){
            self.resetButton.enabled = false
            UIView.animateWithDuration(0.5, animations: {
                //フワーッと広がる
                self.drawingView.frame.size = CGSize(width: self.view.frame.width * 1.1, height: self.view.frame.height * 1.1)
                self.drawingView.frame.origin = CGPoint(x: -(self.view.frame.width * 0.05), y: -(self.view.frame.height * 0.05))
                self.drawingView.alpha = 0
                }) { (value: Bool) -> Void in
                    //アニメーション終了後の処理。元に戻す
                    self.drawingView.clear()
                    self.drawingView.alpha = 1
                    self.drawingView.frame.size = self.view.frame.size
                    self.drawingView.frame.origin = self.view.frame.origin
                    self.resetButton.enabled = true
            }
        }
    }
    @IBAction func undoButtonTapped(sender: AnyObject) {
        self.drawingView.undoLatestStep()
    }
    @IBAction func redoButtonTapped(sender: AnyObject) {
        self.drawingView.redoLatestStep()
    }
    @IBAction func getaButtonTapped(sender: AnyObject) {
        self.sideBar.show()
    }
}

extension DrawingViewController: SideBarViewDelegate {
    func sliderChanged(slider: UISlider) {
        // 筆の太さを変更
        self.drawingView.lineWidth = CGFloat(slider.value)
        
        // SideBarViewの表示を更新する
        updateSideBarView()
    }
    
    // このへんすごい冗長で頭悪い。なんとかしたい。
    // 一番左の色が押された
    func colorView01ButtonTapped(sender: UIButton){
        self.drawingView.lineColor = sideBarView.colorView01.backgroundColor
        updateSideBarViewColors()
    }
    // 左から2番目の色が押された
    func colorView02ButtonTapped(sender: UIButton){
        self.drawingView.lineColor = sideBarView.colorView02.backgroundColor
        updateSideBarViewColors()
    }
    // 左から3番目の
    func colorView03ButtonTapped(sender: UIButton){
        self.drawingView.lineColor = sideBarView.colorView03.backgroundColor
        updateSideBarViewColors()
    }
    // 4番目の
    func colorView04ButtonTapped(sender: UIButton){
        self.drawingView.lineColor = sideBarView.colorView04.backgroundColor
        updateSideBarViewColors()
    }
    // 5番目
    func colorView05ButtonTapped(sender: UIButton){
        self.drawingView.lineColor = sideBarView.colorView05.backgroundColor
        updateSideBarViewColors()
    }
}

