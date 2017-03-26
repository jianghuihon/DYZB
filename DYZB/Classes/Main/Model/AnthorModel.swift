//
//  AnthorModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/25.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class AnthorModel: NSObject {
    
    var vertical_src : String = ""
    var nickname : String = ""
    var online : Int = 0
    var isVertical : Int = 0
    var room_id : Int = 0
    var room_name : String = ""
    var anchor_city : String = ""
    
    init(dict: [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}





























































