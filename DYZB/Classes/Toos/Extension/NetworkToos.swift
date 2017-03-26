//
//  NetworkToos.swift
//  Alamofire的封装
//
//  Created by Enjoy on 2017/3/24.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkToos {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback : @escaping (_ result : Any) -> ())  {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            guard let result = response.result.value else {
                print(response.result.error as! NSError)
                return
            }
            finishedCallback(result)
    }
  }
}

























































