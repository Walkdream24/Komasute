//
//  TabPageNewsView.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/09.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class TabPageNewsView: UIView {
    @IBOutlet weak var tableView: UITableView!
    class func instance() -> TabPageNewsView {
        return UINib(nibName: "TabPageNewsView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! TabPageNewsView
    }
}
