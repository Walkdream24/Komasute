//
//  ErrorFromNetView.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/05/13.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class ErrorFromNetView: UIView {
    class func instance() -> ErrorFromNetView {
        return UINib(nibName: "ErrorFromNetView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ErrorFromNetView
    }

}
