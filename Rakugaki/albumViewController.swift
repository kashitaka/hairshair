//
//  albumViewController.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/23.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import UIKit

class AlbumCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var albumCollectionView: UICollectionView!
    
    
    // MARK: - UIViewControllerDelegate
    override func viewDidLoad() {
        
        // collectionViewDelegateの設定
        albumCollectionView.delegate = self
        albumCollectionView.dataSource = self
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
