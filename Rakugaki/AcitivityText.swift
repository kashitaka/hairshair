//
//  AcitivityText.swift
//  Rakugaki
//
//  Created by kashitaka on 2015/11/29.
//  Copyright © 2015年 kashitaka. All rights reserved.
//

import Foundation

class ActivityText: NSObject, UIActivityItemSource {
    @objc func activityViewControllerPlaceholderItem(activityViewController: UIActivityViewController) -> AnyObject {
        return ""
    }
    
    // 投稿の本文
    @objc func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        if activityType == UIActivityTypePostToTwitter{
            return "#HairShare"
        }
//        if activityType == UIActivityTypeMessage {
//            return "String for message"
//        } else if activityType == UIActivityTypeMail {
//            return "String for mail"
//        } else if activityType == UIActivityTypePostToTwitter {
//            return "String for twitter"
//        } else if activityType == UIActivityTypePostToFacebook {
//            return "String for facebook"
//        }
        return nil
    }
    
    // 投稿の件名
    func activityViewController(activityViewController: UIActivityViewController, subjectForActivityType activityType: String?) -> String {
//        if activityType == UIActivityTypeMessage {
//            return "Subject for message"
//        } else if activityType == UIActivityTypeMail {
//            return "Subject for mail"
//        } else if activityType == UIActivityTypePostToTwitter {
//            return "Subject for twitter"
//        } else if activityType == UIActivityTypePostToFacebook {
//            return "Subject for facebook"
//        }
        return ""
    }
}