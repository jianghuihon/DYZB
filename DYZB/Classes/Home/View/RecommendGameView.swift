//
//  RecommendGameView.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/27.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let collectionGameViewCellID = "CollectionGameViewCell"

private let GameMagin : CGFloat = 10

class RecommendGameView: UIView {

    @IBOutlet weak var collectionGameView: UICollectionView!
    
    var anthorGroups : [GameBaseModel]? {
        didSet{
           collectionGameView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        collectionGameView.register(UINib.init(nibName: collectionGameViewCellID, bundle: nil), forCellWithReuseIdentifier: collectionGameViewCellID)
        collectionGameView.contentInset = UIEdgeInsets(top: GameMagin, left: 10, bottom: 0, right: GameMagin);
    }
}

///加载游戏选择
extension RecommendGameView {
      class func recommendGameView() -> RecommendGameView {
        return Bundle.main.loadNibNamed("RecommendGameView", owner: nil, options: nil)!.first as! RecommendGameView
    }
}

///MARK - UICollectionViewDataSource
extension RecommendGameView : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anthorGroups?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionGameViewCellID, for: indexPath) as! CollectionGameViewCell
            cell.baseModel = anthorGroups?[indexPath.item]
        return cell
    }
}




































