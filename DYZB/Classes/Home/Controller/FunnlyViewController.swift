//
//  FunnlyViewController.swift
//  DYZB
//
//  Created by Enjoy on 2017/4/3.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let top : CGFloat = 8

class FunnlyViewController: BaseAnthorViewController {
    
    fileprivate lazy var funnyViewModel : FunnyViewModel = FunnyViewModel()
}

extension FunnlyViewController {
    override func setupUI() {
        super.setupUI()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        
        collectionView.contentInset = UIEdgeInsets(top: top, left: 0, bottom: 0, right: 0)
    }
}

extension FunnlyViewController {
    override func requestData() {
        super.requestData()
        
        baseVM = funnyViewModel
        
        funnyViewModel.loadFunnyData {
            self.collectionView.reloadData()
            
        }
    }
}
