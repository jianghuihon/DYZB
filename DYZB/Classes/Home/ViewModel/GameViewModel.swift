//
//  GameViewModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/29.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class GameViewModel{
    lazy var games : [GameModel] = [GameModel]()
}

extension GameViewModel {
    func requestGameData(_ finishedCallBack : @escaping () -> ()){
        
        NetworkToos.requestData(.get, URLString: "http://capi.douyucdn.cn/api/v1/getColumnDetail", parameters: ["shortName" : "game"]) { (result) in
            guard let resultDict = result as? [String : Any] else { return }
            guard let dataArr = resultDict["data"] as? [[String : Any]] else { return }
            
            for dic in dataArr {
               self.games.append(GameModel(dict: dic))
            }
            finishedCallBack()
        }
    }
}
