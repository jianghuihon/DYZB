//
//  FunnyViewModel.swift
//  DYZB
//
//  Created by Enjoy on 2017/4/3.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel {

}

extension FunnyViewModel {
    func loadFunnyData(finishedCallback : @escaping () -> ()){
        requestAnthorData(isGroupData: false,urlString: "http://capi.douyucdn.cn/api/v1/getColumnRoom/3", parameter: ["limit" : "30", "offset" : 0], finishedCallback: finishedCallback)
    }
}
