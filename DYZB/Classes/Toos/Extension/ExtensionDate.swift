//
//  ExtensionDate.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/24.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import Foundation

extension NSDate {
    static func getCurrentTime() -> String {
      let noDate = NSDate()
      let interval = Int(noDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
