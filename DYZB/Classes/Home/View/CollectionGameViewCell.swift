//
//  CollectionGameViewCell.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/27.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionGameViewCell: UICollectionViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLa: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconView.clipsToBounds = true
        iconView.layer.cornerRadius = 22.5
    }
    
    var baseModel : GameBaseModel? {
        didSet{
           
           titleLa.text = baseModel?.tag_name
            let iconUrl = URL.init(string: baseModel?.icon_url ?? "")
            iconView.kf.setImage(with: iconUrl, placeholder:  UIImage(named: "home_more_btn"))
        }
    }
}
