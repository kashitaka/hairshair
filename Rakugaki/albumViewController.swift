//
//  albumViewController.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/23.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit

class AlbumCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - member
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    var cellSize: CGSize = CGSize()
    
    // MARK: - UIViewControllerDelegate
    override func viewDidLoad() {
        
        // collectionViewDelegateの設定
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
        
        //　collectionViewCellのサイズを設定する
        cellSize.height = self.view.frame.height / 4
        cellSize.width = self.view.frame.width / 2 - 3
        
        // cellの複数選択を許す
        self.albumCollectionView.allowsMultipleSelection = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (Drawings.shareInstance?.count())!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //cellの初期化
        let cell: AlbumCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("AlbumCollectionViewCell", forIndexPath: indexPath) as! AlbumCollectionViewCell
        
        // Drawingsのkey配列を読み込む
        if let keys: [String] = Drawings.shareInstance?.Keys(){
            cell.imageView.image = Drawings.shareInstance?.image(keys[indexPath.row])
        }
        
        return cell
        
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSize
    }
    
    // MARK: - IBAction
    @IBAction func BackButtonTapped(sender: UIBarButtonItem) {
        // 前画面に戻る
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
