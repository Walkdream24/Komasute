//
//  NothingArticleView.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/28.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class NothingArticleView: UIView {
    class func instance() -> NothingArticleView {
        return UINib(nibName: "NothingArticleView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! NothingArticleView
    }

}
