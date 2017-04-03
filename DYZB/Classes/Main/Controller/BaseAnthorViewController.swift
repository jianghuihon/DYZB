//
//  BaseAnthorViewController.swift
//  DYZB
//
//  Created by Enjoy on 2017/4/1.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

///注册
private let recommentCell = "CollectionViewNomalCell"
let recommentPrettyCell = "CollectionViewPrettyCell"
private let recommentHeader = "HomeHeaderView"

///定义常量
let recommendHeaderViewH : CGFloat = kScreenW * 3 / 8      /// 轮播图的高度
let recommendGameViewH : CGFloat = 90 ///游戏选择的高度

private let itemSpace : CGFloat = 10      ///每张图片的横向间距
let kNomalW = (UIScreen.main.bounds.width - 3 * itemSpace) / 2   ///每张图片的宽度
let kNomalH = kNomalW * 3 / 4    ///让第二组长宽比例为 4 : 3
let kPrettyH = kNomalW * 4 / 3   ///让第二组长宽比例为 3 : 4
private let kHeaderH : CGFloat = 50      ///每个组的头部高度

class BaseAnthorViewController: UIViewController {

    var baseVM : BaseViewModel!

     lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kNomalW, height: kNomalH)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = itemSpace
        layout.headerReferenceSize = CGSize(width: kScreenW, height: kHeaderH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: itemSpace, bottom: 0, right: itemSpace) ///设置每一组的间距
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = UIColor.white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib.init(nibName: recommentCell, bundle: nil), forCellWithReuseIdentifier: recommentCell)
        collectionView.register(UINib.init(nibName: recommentPrettyCell, bundle: nil), forCellWithReuseIdentifier: recommentPrettyCell)
        collectionView.register(UINib.init(nibName: recommentHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: recommentHeader)
        
        return collectionView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        requestData()
    }

}

//请求数据
extension BaseAnthorViewController {
    func requestData(){}
}

//添加UI界面
extension BaseAnthorViewController {
   func setupUI(){
        view.addSubview(collectionView)
    }
}

// MARK - UICollectionViewDataSource, UICollectionViewDelegate
extension BaseAnthorViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if baseVM == nil {
            return 1
        }
        
        return baseVM.anthorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  baseVM == nil {
            return 20
        }
        
        return baseVM!.anthorGroups[section].anthors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommentCell, for: indexPath) as! CollectionViewNomalCell
        
        if baseVM == nil {
            return cell
        }
        
        cell.anthor = baseVM.anthorGroups[indexPath.section].anthors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: recommentHeader, for: indexPath) as! HomeHeaderView
        
        if baseVM == nil {
            return headerView
        }
        
        headerView.group = baseVM.anthorGroups[indexPath.section]
        
        return headerView
    }
}







































