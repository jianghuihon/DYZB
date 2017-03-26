//
//  CycleModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/25.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    // 标题
    var title : String = ""
    // 展示的图片地址
    var pic_url : String = ""
    // 主播信息对应的字典
    var room : [String : NSObject]? {
        didSet {
            guard let room = room else  { return }
            anchor = AnthorModel(dict: room)
        }
    }
    // 主播信息对应的模型对象
    var anchor : AnthorModel?
    
    
    // MARK:- 自定义构造函数
    init(dict : [String : NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

