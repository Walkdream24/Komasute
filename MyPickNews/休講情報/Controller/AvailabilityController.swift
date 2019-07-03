//
//  AvailabilityController.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit

class AvailabilityController: UIViewController {
    let availabiltyView = AvailabilityView.instance()
    let nothingView = NothingArticleView.instance()
    let tableSection = ["",""]
    let kyukouModel = KyukouModel()
    
    var activityIndicatorView = UIActivityIndicatorView()
    fileprivate let refreshCtl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        availabiltyView.frame = self.view.frame
        self.view.addSubview(availabiltyView)
        availabiltyView.tableView.delegate = self
        availabiltyView.tableView.dataSource = self
        availabiltyView.tableView.refreshControl = refreshCtl
        availabiltyView.tableView.tableFooterView = UIView(frame: .zero)
        availabiltyView.tableView.register(UINib(nibName: "ProfessorTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfessorTableViewCell")
        availabiltyView.tableView.register(UINib(nibName: "TodayTableViewCell", bundle: nil), forCellReuseIdentifier: "TodayTableViewCell")
//        availabiltyView.tableView.register(UINib(nibName: "HeaderAtKyukouTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderAtKyukouTableViewCell")
        kyukouModel.getKyukouData() {
            DispatchQueue.main.async {
               self.availabiltyView.tableView.reloadData()
            }
        }
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        //リロード時
        DispatchQueue.main.async {
            self.availabiltyView.tableView.reloadData()
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.refreshCtl.endRefreshing()
            }
    }
}


extension AvailabilityController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return kyukouModel.professorList.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TodayTableViewCell") as! TodayTableViewCell
            cell.todayLabel.text = kyukouModel.today
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
            return cell
            
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessorTableViewCell") as! ProfessorTableViewCell
            let professorList = kyukouModel.professorList[indexPath.row]
            let classNumList = kyukouModel.classNum[indexPath.row]
            cell.professorNameText.text = professorList
            cell.classNumText.text = classNumList
            return cell
        }

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 80
        default:
            return 55
        }
    }
    
    
}

