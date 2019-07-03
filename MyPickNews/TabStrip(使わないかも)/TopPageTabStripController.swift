////
////  TopPageController.swift
////  MyPickNews
////
////  Created by 中重歩夢 on 2019/04/09.
////  Copyright © 2019 Ayumu Nakashige. All rights reserved.
////
//
//import UIKit
//import XLPagerTabStrip
//
//class TopPageTabStripController: BaseButtonBarPagerTabStripViewController<TabCollectionViewCell> {
//
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        
//        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "TabCollectionViewCell", bundle: Bundle(for: TabCollectionViewCell.self), width: { _ in
//            return 90
//        })
//    }
//    override func viewDidLoad() {
//        settings.style.buttonBarBackgroundColor = UIColor.clear
//        settings.style.buttonBarItemBackgroundColor = UIColor.clear
//        settings.style.buttonBarItemTitleColor = UIColor.black
////        settings.style.selectedBarBackgroundColor = UIColor(red: 255/255, green: 157/255, blue: 128/255, alpha: 1.0)
//        settings.style.buttonBarItemFont = UIFont.boldSystemFont(ofSize: 16)
//        settings.style.selectedBarHeight = 0
//        settings.style.buttonBarLeftContentInset = 25
//        settings.style.buttonBarRightContentInset = 25
////        settings.style.buttonBarMinimumLineSpacing = 6
//        // UIColor(red: 46/255, green: 48/255, blue: 61/255, alpha: 1.0)
//        settings.style.buttonBarItemsShouldFillAvailableWidth = true
//        
//        
////        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
////            guard changeCurrentIndex == true else { return }
////            oldCell?.label.textColor = UIColor(hex: "959595")
////            newCell?.label.textColor = UIColor(red: 255/255, green: 157/255, blue: 128/255, alpha: 1.0)
////        }
//        
//        changeCurrentIndexProgressive = { (oldCell: TabCollectionViewCell?, newCell: TabCollectionViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
//            guard changeCurrentIndex == true else { return }
//            oldCell?.tabBackgroundView.backgroundColor = .white
//            oldCell?.titleLabel.textColor = .black
//            newCell?.titleLabel.textColor = .white
//            if newCell?.titleLabel.text == "新着" {
//                newCell?.tabBackgroundView.backgroundColor = UIColor(hex: "FF85A7")
//            } else if newCell?.titleLabel.text == "人気記事" {
//                newCell?.tabBackgroundView.backgroundColor = UIColor(hex: "F3BA72")
//                
//            } else if newCell?.titleLabel.text == "校内情報" {
//                newCell?.tabBackgroundView.backgroundColor = UIColor(hex: "B1DC76")
//            } else if newCell?.titleLabel.text == "Pick駒大生" {
//                newCell?.tabBackgroundView.backgroundColor = UIColor(hex: "99E9EA")
//            } else {
//                newCell?.tabBackgroundView.backgroundColor = UIColor(hex: "9CB4F0")
//            }
//                
//            
//        }
//        
//        super.viewDidLoad()
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        navigationItem.title = "MyPickNews"
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        self.navigationController?.navigationBar.shadowImage = UIImage()
//        self.navigationController?.navigationBar.barTintColor = UIColor(hex: "660066")
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            .foregroundColor: UIColor.black
//        ]
//    }
//    
//    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
//        return [
//            TabPageNewsController.create(genre: 1),
//            TabPageNewsController.create(genre: 2),
//            TabPageNewsController.create(genre: 3),
//            TabPageNewsController.create(genre: 4),
//            TabPageNewsController.create(genre: 5)
//            
//        ]
//    }
//    override func configure(cell: TabCollectionViewCell, for indicatorInfo: IndicatorInfo) {
//        cell.titleLabel.text = indicatorInfo.title
//     
//    }
//
//
// 
//
//}
