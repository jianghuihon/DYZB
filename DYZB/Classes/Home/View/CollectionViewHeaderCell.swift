//
//  CollectionViewHeaderCell.swift
//  DYZB
//
//  Created by Enjoy on 2017/3/26.
//  Copyright © 2017年 SZCE. All rights reserved.
//

import UIKit
import Kingfisher

class CollectionViewHeaderCell: UICollectionViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLa: UILabel!
    
    var cycleModel : CycleModel? {
        didSet{
           titleLa.text = cycleModel?.title
           let url = URL.init(string:cycleModel?.pic_url ?? "")!
           iconView.kf.setImage(with: url)
        }
    }
}











































