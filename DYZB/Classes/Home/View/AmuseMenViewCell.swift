//
//  AmuseMenViewCell.swift
//  DYZB
//
//  Created by Enjoy on 2017/4/2.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let itemWidth = kScreenW / 4
private let cellID = "CollectionGameViewCell"

class AmuseMenViewCell: UICollectionViewCell {

    var anthorGroups : [AuthorGroup]? {
        didSet{
           collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib.init(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }
}

extension AmuseMenViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anthorGroups?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionGameViewCell
         cell.baseModel = anthorGroups![indexPath.item]
        
        cell.clipsToBounds = true
        
        return cell
    }
}







