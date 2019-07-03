//
//  NewsTableViewCell.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/09.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!

 
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //contentsのサイズに合わせてobujectのサイズを変える
        titleLabel.sizeToFit()
//        単語の途中で改行されないようにする
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
//        thumbnail.layer.cornerRadius = 12
//        thumbnail.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
//        cardView.layer.cornerRadius = 12
//        cardView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }

    
}
