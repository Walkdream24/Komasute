//
//  DetailOfArticleView.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/09.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit
import WebKit

class DetailOfArticleView: UIView {
    @IBOutlet weak var wkWebView: WKWebView!
    class func instance() -> DetailOfArticleView {
        return UINib(nibName: "DetailOfArticleView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! DetailOfArticleView
    }
    

}
