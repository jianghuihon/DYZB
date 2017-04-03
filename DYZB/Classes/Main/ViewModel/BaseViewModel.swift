//
//  BaseViewModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/4/1.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class BaseViewModel {
    lazy var anthorGroups : [AuthorGroup] = [AuthorGroup]()
}

extension BaseViewModel {
    func requestAnthorData(isGroupData : Bool, urlString : String, parameter : [String : Any]? = nil, finishedCallback : @escaping () -> ()){
    NetworkToos.requestData(.get, URLString: urlString, parameters: parameter) { (result) in
        guard let resultDict = result as? [String : NSObject] else { return }
        guard let resultArr = resultDict["data"] as? [[String : Any]] else { return }
        
        if isGroupData {
            for dict in resultArr {
                self.anthorGroups.append(AuthorGroup(dict: dict))
            }
        }else{
          let anthorGroup = AuthorGroup()
           
            for dict in resultArr {
               anthorGroup.anthors.append(AnthorModel(dict: dict))
            }
            
            self.anthorGroups.append(anthorGroup)
        }
        
         finishedCallback()
        }
    }
}
