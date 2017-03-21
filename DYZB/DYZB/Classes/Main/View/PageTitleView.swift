//
//  PageTitleView.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/19.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate : class{
    func pageTitleView(titleView : PageTitleView, selectIndex index : Int)
}

//MARK - 设置常量
private let scrollLineH : CGFloat = 2
private let kNormal : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelected : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

class PageTitleView: UIView {
   //用于保存标题数组
   fileprivate var titles : [String]
    //用于保存当前titleLabel的tag值
   fileprivate var currentIndex : Int = 0
    //声明代理
   weak var delegate : PageTitleViewDelegate?
    //懒加载标题栏控件
   fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    //懒加载UIScrollView
   fileprivate lazy var scrollow : UIScrollView = {
        let scrollow = UIScrollView()
//        scrollow.backgroundColor = UIColor.yellow
        scrollow.bounces = false
        scrollow.showsHorizontalScrollIndicator = false
        scrollow.scrollsToTop = false
        return scrollow
    }()
    
    //懒加载标题栏滚动条
    fileprivate lazy var scrollViewLine : UIView = {
       let scrollViewLine = UIView()
       scrollViewLine.backgroundColor = UIColor.orange
        
        return scrollViewLine
    }()
    
    //重写init方法
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
       
        setupUI();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//添加UI
extension PageTitleView{
    func setupUI(){
        addSubview(scrollow)
        scrollow.frame = bounds
        
       setupTitleLabels()
       
       setupBottomLine()
    }
    
    ///添加titleLabel
    fileprivate func setupTitleLabels(){
        let titleLaW : CGFloat = frame.width / CGFloat(titles.count)
        let titleLaH : CGFloat = frame.height / scrollLineH
        let titleLaY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
        let titleLa = UILabel()
            titleLa.text = title
            titleLa.tag = index
            titleLa.textColor = UIColor(r: kNormal.0, g: kNormal.1, b: kNormal.2)
            titleLa.textAlignment = .center
            titleLa.font = UIFont.systemFont(ofSize: 15)
            let tilteLaX : CGFloat = titleLaW * CGFloat(index)
            titleLa.frame = CGRect(x: tilteLaX, y: titleLaY, width: titleLaW, height: titleLaH)
            
            scrollow.addSubview(titleLa)
            titleLabels.append(titleLa)
            
            titleLa.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.titleLaClick(_:)))
            titleLa.addGestureRecognizer(tap)
        }
    }
    
    ///添加titleView灰色下画线
    fileprivate func setupBottomLine(){
    let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.gray
        let bottomLineH : CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - bottomLineH, width: frame.width, height: bottomLineH)
        
        addSubview(bottomLine)
        
        guard let fristLabel = titleLabels.first else{return}
        fristLabel.textColor = UIColor(r: kSelected.0, g: kSelected.1, b: kSelected.2)
        scrollow.addSubview(scrollViewLine)
        scrollViewLine.frame = CGRect(x: fristLabel.frame.origin.x, y: frame.height - scrollLineH, width: fristLabel.frame.width, height: scrollLineH)
    }
}

///实现点击titleLabel手势方法界面的改变
extension PageTitleView{
    @objc fileprivate func titleLaClick(_ tap : UITapGestureRecognizer){
        guard let currrentLabel = tap.view as? UILabel else{ return }
        
        if currrentLabel.tag == currentIndex { return }
        
        let oldLa = titleLabels[currentIndex]
        currrentLabel.textColor = UIColor(r: kSelected.0, g: kSelected.1, b: kSelected.2)
        oldLa.textColor = UIColor(r: kNormal.0, g: kNormal.1, b: kNormal.2)
        currentIndex = currrentLabel.tag
        
        let scrollLineX = scrollViewLine.frame.width * CGFloat(currentIndex)
        UIView.animate(withDuration: 0.2) { 
            self.scrollViewLine.frame.origin.x = scrollLineX
        }
        
        delegate?.pageTitleView(titleView: self, selectIndex: currentIndex)
    }
}

///对外界暴露方法把所需要的参数传过来显示对应的标题栏
extension PageTitleView{
    func setTitleView(progress : CGFloat, sourceIndex : Int, targetIndex : Int){
    
        let sourceLabel = titleLabels[sourceIndex]
        let targetLabel = titleLabels[targetIndex]
        
        ///设置下滑线滑动的位置
        let moveTotalX = targetLabel.frame.origin.x - sourceLabel.frame.origin.x
        let moveX = moveTotalX * progress
        scrollViewLine.frame.origin.x = sourceLabel.frame.origin.x + moveX
        
        ///设置标题栏标题文字颜色的改变
        let colorData = (kSelected.0 - kNormal.0, kSelected.1 - kNormal.1, kSelected.2 - kNormal.2)
        
        sourceLabel.textColor = UIColor(r: kSelected.0 - colorData.0 * progress, g: kSelected.1 - colorData.1 * progress, b: kSelected.2 - colorData.2 * progress)
        
        targetLabel.textColor = UIColor(r: kNormal.0 + colorData.0 * progress, g: kNormal.1 + colorData.1 * progress, b: kNormal.2 + colorData.2 * progress)
        
        //记录当前标题栏所显示的控件的下标
        currentIndex = targetIndex
    }

}












































