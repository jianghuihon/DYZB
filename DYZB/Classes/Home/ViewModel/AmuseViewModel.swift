//
//  AmuseViewModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/31.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class AmuseViewModel : BaseViewModel{

}

extension AmuseViewModel {
    func requestAmuseData(_ finishedCallback : @escaping ()->()){
        requestAnthorData(isGroupData: true,urlString: "http://capi.douyucdn.cn/api/v1/getHotRoom/2" ) {
            finishedCallback()
        }
    }
}
