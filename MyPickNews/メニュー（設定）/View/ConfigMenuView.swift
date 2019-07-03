//
//  ConfigMenuView.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/05/13.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class ConfigMenuView: UIView {
    @IBOutlet weak var tableView: UITableView!
    
    class func instance() -> ConfigMenuView {
        return UINib(nibName: "ConfigMenuView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ConfigMenuView
    }


}
