//
//  AvailabilityView.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class AvailabilityView: UIView {
    @IBOutlet weak var tableView: UITableView!
    class func instance() -> AvailabilityView {
        return UINib(nibName: "AvailabilityView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! AvailabilityView
    }

}
