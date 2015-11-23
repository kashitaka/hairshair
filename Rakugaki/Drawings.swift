//
//  Drawings.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/23.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import Foundation

public class Drawings {
    var drawings = [String: String]()
    let path: String
    
    // シングルトン実装
    public class var shareInstance: Drawings? {
        struct Static {
            static let instance = Drawings()
        }
        return Static.instance
    }
    
    // イニシャラザ（失敗可能）
    private init?(){
        // データ保存先パスを取得。Documentディレクトリのパスを取得する
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentationDirectory, .UserDomainMask, true)
        // 基本的には成功するが念のために要素数をチェックしてから使う
        if paths.count > 0 {
            path = paths[0] as String
        }else {
            path = ""
            return nil
        }
        // 取得したパスを元にuserDefaultからデータ読み込む
        load()
    }
    
    // データの読み込み
    private func load(){
        drawings.removeAll()
        let ud = NSUserDefaults.standardUserDefaults()
        // Stringの配列Drawingsを登録
        ud.registerDefaults([
            "drawings": [String: String]()
        ])
        ud.synchronize()
        if let drawings = ud.objectForKey("drawings") as? [String: String]{
            self.drawings = drawings
        }
    }
    
    // データの保存
    public func save(){
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(drawings, forKey: "drawings")
        ud.synchronize()
    }
    
    // 落書きを追加する
    public func append(drawDate: String, drawing: UIImage){
        // ユニークなファイル名を生成する
        let filename = NSUUID().UUIDString + ".png"
        let fullpath = NSURL(fileURLWithPath: path).URLByAppendingPathComponent(filename).path
        
        //uiimageからpngデータを作成
        let data = UIImagePNGRepresentation(drawing)
        
        // データを書き込み、成功したら配列に格納して保存する
        if data!.writeToFile(fullpath!, atomically: true){
            drawings[drawDate] = filename
        }
        save()
    }
    
    // 指定された日付の配列を引数に、その画像を削除する
    public func remove(dates: [String]){
        for date in dates{
            if let filename = drawings[date]{
                let fullpath = path.stringByAppendingString(filename)
            
                let manager = NSFileManager()
                do {
                    // fileを消す
                    try manager.removeItemAtPath(fullpath)
                    // drawingsの配列から削除
                    self.drawings.removeValueForKey(date)
                } catch _ {}
            }
        }
        save()
    }
    
    // 指定された日付の写真を返す
    public func image(drawDate: String) -> UIImage{
        // 指定された日付が存在しない場合は空のimageを返す
        if drawings[drawDate] == nil {return UIImage()}
        if let filename = drawings[drawDate]{
            let fullpath = path.stringByAppendingString(filename)
            
            if let image = UIImage(contentsOfFile: fullpath){
                return image
            }
        }
        // 上記に失敗した場合は空のuiimageを返す
        return UIImage()
    }
    
    // 保存済みの写真枚数を返す
    public func count() -> Int {
        return drawings.count
    }
}