//
//  RecommendHeaderView.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/25.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let RecommendHeaderViewCellID = "CollectionViewHeaderCell"

class RecommendHeaderView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    var cycletTimer : Timer?
    
    var cycleModels : [CycleModel]? {
        didSet{
           collectionView.reloadData()
           pageControl.numberOfPages = cycleModels?.count ?? 0
            
           ///让轮播图在页码为1的情况下能向右边拖拽
           let indexPath = NSIndexPath.init(item: (cycleModels?.count ?? 0) * 10, section: 0)
           collectionView.scrollToItem(at: indexPath as IndexPath, at: .left, animated: false)
           addTimer()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        autoresizingMask = UIViewAutoresizing() ///让其不随父控件缩放而缩放
        
        collectionView.register(UINib.init(nibName: "CollectionViewHeaderCell", bundle: nil), forCellWithReuseIdentifier: RecommendHeaderViewCellID)
    }
    
    ///创建collectionView的布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
    }
}

///导出xib添加到推荐页面
extension RecommendHeaderView {
    class func recommendHeaderView() -> RecommendHeaderView{
      return Bundle.main.loadNibNamed("RecommendHeaderView", owner: nil, options: nil)!.first as! RecommendHeaderView
    }
}

///MARK - UICollectionViewDataSource
extension RecommendHeaderView : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ///给其提供多张图片
        return (cycleModels?.count ?? 0) * 10000
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendHeaderViewCellID, for: indexPath) as! CollectionViewHeaderCell
        
        let cycleModel = cycleModels?[indexPath.item % (cycleModels?.count)!] ///防止越界
        cell.cycleModel = cycleModel

        return cell
    }
    
    ///拖拽轮播图片时PageControl实现对应的页码
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageX = (scrollView.contentOffset.x + scrollView.bounds.width * 0.5) / scrollView.bounds.width
        
        pageControl.currentPage = Int(pageX) % (cycleModels?.count ?? 1)
    }
    
    ///开始拖拽时移除订书器
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    ///结束拖拽添加定时器
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
}

///实现自动滚动轮播图
extension RecommendHeaderView {
    ///添加定时器
    func addTimer(){
        cycletTimer = Timer(timeInterval: 3.0, target: self, selector: #selector(self.moveToScrollNext), userInfo: nil, repeats: true)
        RunLoop.main.add(cycletTimer!, forMode: RunLoopMode.commonModes)
    }
    ///移除定时器
    func removeTimer(){
        cycletTimer?.invalidate()
        cycletTimer = nil
    }
    
    func moveToScrollNext(){
       let offsetX = collectionView.contentOffset.x
       let currentOffsetX = offsetX + collectionView.bounds.width 
       collectionView.setContentOffset(CGPoint.init(x: currentOffsetX, y: 0), animated: true)
    }
}




















































