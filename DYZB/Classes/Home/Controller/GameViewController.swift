//
//  GameViewController.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/29.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

///定义常量
private let kSreenWidth = UIScreen.main.bounds.width
private let kHeaderViewH : CGFloat = 50
private let engeMarin : CGFloat = 10
private let itemWidth : CGFloat = (kSreenWidth - 2 * engeMarin) / 3
private let itemHeight : CGFloat = itemWidth * 6 / 5
private let topHeaderViewH : CGFloat = 50
private let gameViewH : CGFloat = 90

///注册cell
private let cellID = "CollectionGameViewCell"
private let headerViewID = "HomeHeaderView"

class GameViewController: UIViewController {

    lazy var gameViewModel : GameViewModel = GameViewModel()
    
    lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: engeMarin, bottom: 0, right: engeMarin)
        layout.headerReferenceSize = CGSize(width: kSreenWidth, height: kHeaderViewH)
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self

        collectionView.register(UINib.init(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        collectionView.register(UINib.init(nibName: headerViewID, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewID)

        return collectionView
    }()
    
    lazy var topHeaderView : HomeHeaderView = {
        let topHeaderView = HomeHeaderView.loadTopHeaderView()
            topHeaderView.frame = CGRect(x: 0, y: -(topHeaderViewH + gameViewH), width: kScreenW, height: topHeaderViewH)
            topHeaderView.iconView.image = UIImage.init(named: "Img_orange")
            topHeaderView.titleLa.text = "常见"
            topHeaderView.moreBtn.isHidden = true
        return topHeaderView
    }()
    
    lazy var gameView : RecommendGameView = {
          let gameView = RecommendGameView.recommendGameView()
          gameView.frame = CGRect(x: 0, y: -gameViewH, width: kScreenW, height: gameViewH)
          return gameView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        loadData()
    }
}

///请求数据
extension GameViewController {
    fileprivate func loadData(){
        
        gameViewModel.requestGameData {
            self.collectionView.reloadData()
            self.gameView.anthorGroups = Array(self.gameViewModel.games[0..<10])
        }
    }
}

///请求UI界面
extension GameViewController {
    fileprivate func setupUI(){
    
        view.addSubview(collectionView)
        
        collectionView.addSubview(topHeaderView)
        
        collectionView.addSubview(gameView)
        
        collectionView.contentInset = UIEdgeInsets(top: topHeaderViewH + gameViewH, left: 0, bottom: 0, right: 0)
    }
}

///数据源方法
extension GameViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameViewModel.games.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CollectionGameViewCell
        cell.baseModel = gameViewModel.games[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerViewID, for: indexPath) as! HomeHeaderView
        headerView.titleLa.text = "全部"
        headerView.iconView.image = UIImage.init(named: "Img_orange")
        headerView.moreBtn.isHidden = true
        
        return headerView
    }
}























