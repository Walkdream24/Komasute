//
//  InviteTableViewCell.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class InviteTableViewCell: UITableViewCell {

    @IBOutlet weak var inviteBGView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        inviteBGView.layer.cornerRadius = 20
    }

    
}
