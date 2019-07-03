//
//  VoteTableViewCell.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

protocol VacantButtonTappedDelegate: class {
    func vacantButtonTapped()
}
protocol SubtleButtonTappedDelegate: class {
    func subtleButtonTapped()
}
protocol NoVacantButtonTappedDelegate: class {
    func noVacantButtonTapped()
}


class VoteTableViewCell: UITableViewCell {
    weak var vacantDelegate: VacantButtonTappedDelegate?
    weak var subtleDelegate: SubtleButtonTappedDelegate?
    weak var noVacantDelegate: NoVacantButtonTappedDelegate?
    @IBOutlet weak var vacantValue: UILabel!
    @IBOutlet weak var subtleValue: UILabel!
    @IBOutlet weak var noVacantValue: UILabel!
    @IBOutlet weak var vacantBt: UIButton!
    @IBOutlet weak var subtleBt: UIButton!
    @IBOutlet weak var noVacantBt: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    @IBAction func vacantButton(_ sender: Any) {
        vacantDelegate?.vacantButtonTapped()
    }
    
    @IBAction func subtleButton(_ sender: Any) {
        subtleDelegate?.subtleButtonTapped()
    }
    @IBAction func noVacantButton(_ sender: Any) {
        noVacantDelegate?.noVacantButtonTapped()
    }
}
