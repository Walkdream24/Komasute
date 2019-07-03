//
//  MyTabBarViewController.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class MyTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //    UITabBar.appearance().tintColor = UIColor(hex: "8560DE")
        // タブバーアイコン選択時の色を変更（iOS 9以前でも利用可能）
        UITabBar.appearance().tintColor = UIColor(hex: "8560DE")
        // タブバーアイコン非選択時の色を変更（iOS 10で利用可能）
        UITabBar.appearance().unselectedItemTintColor = UIColor(hex: "B4B4B4")
    }
    


}
