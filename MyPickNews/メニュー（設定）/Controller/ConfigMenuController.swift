//
//  ConfigMenuController.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/05/13.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class ConfigMenuController: UIViewController {

    let configMenuView = ConfigMenuView.instance()
    let menuWordArray = ["お問い合わせ","アプリを評価する","通知設定"]
    let tableSection = ["",""]
    override func viewDidLoad() {
        super.viewDidLoad()
        configMenuView.frame = self.view.frame
        self.view.addSubview(configMenuView)
        configMenuView.tableView.delegate = self
        configMenuView.tableView.dataSource = self
        configMenuView.tableView.tableFooterView = UIView(frame: .zero)
        configMenuView.tableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuTableViewCell")
         configMenuView.tableView.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "EmptyTableViewCell")

    }
    
}
extension ConfigMenuController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell") as! EmptyTableViewCell
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as! MenuTableViewCell
            cell.menuLabel.text = menuWordArray[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 10
        default:
            return 50
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            print("")
        default:
            switch indexPath.row {
            case 0:
                print("message")
                let messageVc = UIStoryboard(name: "MessageViewController", bundle: nil).instantiateViewController(withIdentifier: "Message") as! MessageViewController
                self.present(messageVc, animated: true, completion: nil)
            case 1:
                if let url = URL(string: "itms-apps://itunes.apple.com/app/id1456245094?action=write-review") {
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(url, options: [:])
                    } else {
                        UIApplication.shared.openURL(url)
                    }
                }
            default:
                guard let bundle = Bundle.main.bundleIdentifier else { return }
                
                if #available(iOS 11.0, *) {
                    let path = "app-settings:root=NOTIFICATIONS_ID&path=" + bundle
                    if let url = URL(string: path) {
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    }
                } else {
                    let path = "prefs:root=NOTIFICATIONS_ID&path=" + bundle
                    if let url = URL(string: path) {
                        UIApplication.shared.openURL(url)
                    }
                }
            }
        }
        
    }
}
