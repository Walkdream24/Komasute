//
//  KerningLabel.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/05/12.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class KerningLabel: UILabel {
    @IBInspectable var kerning: CGFloat = 0.0 {
        didSet {
            if let attributedText = self.attributedText {
                let attribString = NSMutableAttributedString(attributedString: attributedText)
                attribString.addAttributes([.kern: kerning], range: NSRange(location: 0, length: attributedText.length))
                self.attributedText = attribString
            }
        }
    }
}
