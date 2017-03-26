//
//  AuthorGroup.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/24.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class AuthorGroup: NSObject {
    var room_list : [[String : NSObject]]? {
    didSet{
        guard let room_list = room_list else { return }
        
        for dict in room_list {
            anthors.append(AnthorModel.init(dict: dict))
         }
       }
    }
    
    var tag_name : String = ""
    var icon_name : String = "home_header_normal"
    lazy var anthors : [AnthorModel] = [AnthorModel]()
    ///构造函数
    override init() {}
    
    init(dict : [String : NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
