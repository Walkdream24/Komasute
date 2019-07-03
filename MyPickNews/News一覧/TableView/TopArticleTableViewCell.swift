//
//  TopArticleTableViewCell.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class TopArticleTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        //        単語の途中で改行されないようにする
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        cardView.layer.cornerRadius = 13


        
    }


    
}
