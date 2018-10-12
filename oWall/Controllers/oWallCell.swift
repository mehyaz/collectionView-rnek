//
//  oWallCell.swift
//  oWall
//
//  Created by Mehmet Yazık on 7.10.2018.
//  Copyright © 2018 Mehmet Yazık. All rights reserved.
//

import UIKit

class oWallCell: UICollectionViewCell {
 
    @IBOutlet weak var isimLabel: UILabel!
    @IBOutlet weak var resimImgView: UIImageView!
    
    override func awakeFromNib() {
        resimImgView.layer.cornerRadius = 10
        resimImgView.clipsToBounds = true
    }
    
}
