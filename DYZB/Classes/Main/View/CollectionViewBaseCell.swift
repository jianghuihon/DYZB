//
//  CollectionViewBaseCell.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/25.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit

class CollectionViewBaseCell: UICollectionViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var onlineBtn: UIButton!
    @IBOutlet weak var nikNameLa: UILabel!
    
    var anthor : AnthorModel? {
        didSet{
            guard let anthor = anthor else { return }
            
            guard let iconName = URL.init(string: anthor.vertical_src) else { return }
            iconView.kf.setImage(with: iconName)
            
            nikNameLa.text = anthor.nickname
            
            var onlineStr = ""
            if anthor.online > 10000
            {
                onlineStr = "\(Int(anthor.online / 10000))万人在线"
            }else{
                onlineStr = "\(anthor.online)在线"
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        iconView.clipsToBounds = true
        iconView.layer.cornerRadius = 5
        
        onlineBtn.clipsToBounds = true
        onlineBtn.layer.cornerRadius = 3
    }
}
