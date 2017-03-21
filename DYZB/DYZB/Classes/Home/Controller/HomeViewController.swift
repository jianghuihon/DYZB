//
//  HomeViewController.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/19.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

private let pageTitleViewH : CGFloat = 40

class HomeViewController: UIViewController {
///懒加载pageTitleView
    fileprivate lazy var pageTitleView : PageTitleView = {[weak self] in
        let frame: CGRect = CGRect(x: 0, y: kStatusH + kNavigationBarH, width: kScreenW, height: pageTitleViewH)
        let titles: [String] = ["推荐", "游戏", "娱乐", "趣玩"]
        let pageTitleView = PageTitleView.init(frame: frame, titles: titles)
        pageTitleView.delegate = self
        return pageTitleView
    }()
///懒加载pageContentView    
    fileprivate lazy var pageContentView : PageContentView = {[weak self] in
        
        // 1.确定内容的frame
        let contentH = kScreenH - kStatusH - kNavigationBarH - pageTitleViewH
        let contentFrame = CGRect(x: 0, y: kStatusH + kNavigationBarH + pageTitleViewH, width: kScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<4 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(r: CGFloat(arc4random_uniform(255)), g: CGFloat(arc4random_uniform(255)), b: CGFloat(arc4random_uniform(255)))
            childVcs.append(vc)
        }
        
        let pageContentView = PageContentView(frame: contentFrame, childVCs: childVcs, parentViewController: self)
            pageContentView.delegate = self
        return pageContentView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置界面UI
        automaticallyAdjustsScrollViewInsets = false
        setupUI()
    }
    
}

extension HomeViewController{
    func setupUI(){
        //设置导航按钮
        setNavigationBar()
        
        //添加标题栏
        view.addSubview(pageTitleView)
        
        //添加内容界面
        view.addSubview(pageContentView)
    }
    
    func setNavigationBar(){
        //导航左边按钮
        let size = CGSize(width: 20, height: 20)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(imageName: "logo")
        
        //导航右边历史按钮
        let historyItem = UIBarButtonItem.init(imageName: "image_my_history", hightImage: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem.init(imageName: "btn_search", hightImage: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem.init(imageName: "Image_scan", hightImage: "Image_scan_click", size: size)
        
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
}

///实现代理方法给pageContentView传下标值显示对应的View
extension HomeViewController : PageTitleViewDelegate{
    func pageTitleView(titleView: PageTitleView, selectIndex index: Int) {
        pageContentView.setCurrentIndex(selectIndex: index)
    }
}

///实现代理方法给pageTitleView传下标值显示对应的标题栏
extension HomeViewController : PageContentViewDelegate{
    func pageContentView(pageContentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        pageTitleView.setTitleView(progress: progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
}












