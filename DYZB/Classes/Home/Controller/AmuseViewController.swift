//
//  AmuseViewController.swift
//  DYZB
//
//  Created by Enjoy on 2017/4/1.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let menuViewH : CGFloat = 200

class AmuseViewController: BaseAnthorViewController {
    
   fileprivate lazy var amuseVM : AmuseViewModel = AmuseViewModel()
   fileprivate lazy var menuView : AmuseMenView = {
       let menuView = AmuseMenView.loadMenView()
        menuView.frame = CGRect(x: 0, y: -menuViewH, width: kScreenW, height: menuViewH)
    
        return menuView
    }()
}

//请求数据
extension AmuseViewController {
    override func requestData(){
        baseVM = amuseVM

        amuseVM.requestAmuseData({
        self.collectionView.reloadData()
        
        var tempArr = self.amuseVM.anthorGroups
            tempArr.remove(at: 0)
        self.menuView.anthorGroups = tempArr
            
        })
    }
}

extension AmuseViewController {
    override func setupUI() {
        super.setupUI()
        
        collectionView.addSubview(menuView)
        collectionView.contentInset = UIEdgeInsets(top: menuViewH, left: 0, bottom: 0, right: 0)
    }
}












































