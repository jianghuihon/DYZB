//
//  UIBarButton.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/19.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    /*
    class func creatItem(imageName: String, hightImage: String, size: CGSize) -> UIBarButtonItem{
        
        let historyBtn = UIButton()
        historyBtn.frame = CGRect(origin: CGPoint.zero, size: size)
        historyBtn.setImage(UIImage.init(named: imageName), for: .normal)
        historyBtn.setImage(UIImage.init(named: hightImage), for: .highlighted)
        let historyItem = UIBarButtonItem(customView: historyBtn)
        
        return historyItem
    }*/
    
    convenience init(imageName: String, hightImage: String = "", size: CGSize = CGSize.zero) {
        let historyBtn = UIButton()
        historyBtn.setImage(UIImage.init(named: imageName), for: .normal)

        if hightImage != ""
        {
            historyBtn.setImage(UIImage.init(named: hightImage), for: .highlighted)
        }
        if size != CGSize.zero
        {
            historyBtn.frame = CGRect(origin: CGPoint.zero, size: size)
        }else{
          historyBtn.sizeToFit()
        }
        
        let view : UIView = UIView()
        view.frame = historyBtn.bounds
        view.addSubview(historyBtn)
        self.init(customView: view)
    }
}




























