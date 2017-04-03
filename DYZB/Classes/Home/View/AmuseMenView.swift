//
//  AmuseMenView.swift
//  DYZB
//
//  Created by Enjoy on 2017/4/2.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let menuViewCellID = "AmuseMenViewCell"

class AmuseMenView: UIView {

    var anthorGroups : [AuthorGroup]? {
        didSet{
           collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib.init(nibName: menuViewCellID, bundle: nil), forCellWithReuseIdentifier: menuViewCellID)
        autoresizingMask = UIViewAutoresizing()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

extension AmuseMenView {
  class func loadMenView() -> AmuseMenView {
      return Bundle.main.loadNibNamed("AmuseMenView", owner: nil, options: nil)!.first as! AmuseMenView
    }
}

extension AmuseMenView : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if anthorGroups == nil { return 0 }
        
        let pageNum = (anthorGroups!.count - 1) / 8 + 1
        pageControl.numberOfPages = pageNum
        
        return pageNum
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menuViewCellID, for: indexPath) as! AmuseMenViewCell
        
        setupData(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(collectionView.contentOffset.x / scrollView.frame.width)
    }
    
    fileprivate func setupData(cell : AmuseMenViewCell, indexPath : IndexPath){
         //第一页 0 - 7
        // 第二页 8 - 15
        //第三页  16 - 23
        
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        
        if endIndex > anthorGroups!.count - 1 {
            endIndex = anthorGroups!.count - 1
        }
        
        cell.anthorGroups = Array(anthorGroups![startIndex...endIndex])
    }
}













