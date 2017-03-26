//
//  RecommendHeaderView.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/25.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let RecommendHeaderViewCellID = "RecommendHeaderViewCell"

class RecommendHeaderView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: RecommendHeaderViewCellID)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

extension RecommendHeaderView {
    class func recommendHeaderView() -> RecommendHeaderView{
      return Bundle.main.loadNibNamed("RecommendHeaderView", owner: nil, options: nil)!.first as! RecommendHeaderView
    }
}

///MARK - UICollectionViewDataSource
extension RecommendHeaderView : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendHeaderViewCellID, for: indexPath)
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.red : UIColor.green
        
        return cell
    }
}










