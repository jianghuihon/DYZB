//
//  RecommendViewModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/24.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class RecommendViewModel {

    lazy var dataArr : [AuthorGroup] = [AuthorGroup]()
    lazy var cycleModels : [CycleModel] = [CycleModel]()
    fileprivate lazy var bigDataGroup : AuthorGroup = AuthorGroup()
    fileprivate lazy var prettyGroup : AuthorGroup = AuthorGroup()
}

extension RecommendViewModel {
    ///请求数据
    func requestData(_ finishedCallback : @escaping () -> ()){
        ///定义参数
        let paramters = ["limit" : "4", "offset" : "0", "time" : NSDate.getCurrentTime()]
        
        let disGroup = DispatchGroup()
         ///请求推荐数据
        disGroup.enter()
        NetworkToos.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: ["time" : NSDate.getCurrentTime()]) { (result) in
            guard let resultDict = result as? [String : NSObject] else { return }
            guard let resultArr = resultDict["data"] as? [[String : NSObject]] else { return }
            
            self.bigDataGroup.tag_name = "热门"
            self.bigDataGroup.icon_name = "home_header_hot"
            
            for dict in resultArr {
                let anchor = AnthorModel(dict: dict)
                self.bigDataGroup.anthors.append(anchor)
            }
            disGroup.leave()
        }
        
        disGroup.enter()
        ///请求颜值
        NetworkToos.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", parameters: paramters) { (result) in
            guard let resultDict = result as? [String : NSObject] else { return }
            guard let resultArr = resultDict["data"] as? [[String : NSObject]] else { return }
            
            self.prettyGroup.tag_name = "颜值"
            self.prettyGroup.icon_name = "home_header_phone"
            
            for dict in resultArr {
                let author = AnthorModel(dict: dict)
                self.prettyGroup.anthors.append(author)
            }
            disGroup.leave()
        }
        
        disGroup.enter()
        ///请求2-12游戏数据
        NetworkToos.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getHotCate", parameters: paramters) { (result) in
            guard let resultDict = result as? [String : NSObject] else { return }
            guard let resultArr = resultDict["data"] as? [[String : NSObject]] else { return }
            
            for dict in resultArr {
                let group = AuthorGroup(dict: dict)
                self.dataArr.append(group)
            }
            disGroup.leave()
        }
        
        disGroup.notify(queue: DispatchQueue.main)
        {
            self.dataArr.insert(self.prettyGroup, at: 0)
            self.dataArr.insert(self.bigDataGroup, at: 0)
            finishedCallback()
        }
    }
    
    func requestCycleData(_ finishedCallback : @escaping () -> ()){
    
        NetworkToos.requestData(.get, URLString: "http://www.douyutv.com/api/v1/slide/6", parameters: ["version" : "2.300"]) { (result) in
            // 1.获取整体字典数据
            guard let resultDict = result as? [String : NSObject] else { return }
            
            // 2.根据data的key获取数据
            guard let dataArray = resultDict["data"] as? [[String : NSObject]] else { return }
            
            // 3.字典转模型对象
            for dict in dataArray {
                self.cycleModels.append(CycleModel(dict: dict))
            }
            finishedCallback()
        }
    }
}




















































