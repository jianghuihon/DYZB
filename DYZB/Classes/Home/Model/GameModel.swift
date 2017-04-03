//
//  GameModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/30.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class GameModel: GameBaseModel {

    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
