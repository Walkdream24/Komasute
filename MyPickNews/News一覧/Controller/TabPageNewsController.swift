//
//  TabPageNewsController.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/09.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import FirebaseStorage

class TabPageNewsController: UIViewController {
    
    let tabpageView = TabPageNewsView.instance()
    let nothingView = NothingArticleView.instance()
    let articleModel = ArticleModel()
    let firebaseModel = ModelFromFirebase()
    let tableSection = ["","",""]
    var activityIndicatorView = UIActivityIndicatorView()
    fileprivate let refreshCtl = UIRefreshControl()


    
    override func viewDidLoad() {
        super.viewDidLoad()
            tabpageView.frame = self.view.frame
            self.view.addSubview(tabpageView)
        
        tabpageView.tableView.delegate = self
        tabpageView.tableView.dataSource = self
        tabpageView.tableView.refreshControl = refreshCtl
        tabpageView.tableView.tableFooterView = UIView(frame: .zero)
        tabpageView.tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tabpageView.tableView.register(UINib(nibName: "TopArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "TopArticleTableViewCell")
        tabpageView.tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        tabpageView.tableView.register(UINib(nibName: "NothingTableViewCell", bundle: nil), forCellReuseIdentifier: "NothingTableViewCell")
        refreshCtl.addTarget(self, action: #selector(TabPageNewsController.refresh(sender:)), for: .valueChanged)
        
        
        self.navigationController?.navigationBar.titleTextAttributes
            = [NSAttributedString.Key.font: UIFont(name: "Corporate-Logo-Rounded", size: 25)!]

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        firebaseModel.articleData {
            DispatchQueue.main.async {
                self.tabpageView.tableView.reloadData()
            }
        }
    }

    @objc func refresh(sender: UIRefreshControl) {
        //リロード時
        firebaseModel.articleData {
            DispatchQueue.main.async {
                self.tabpageView.tableView.reloadData()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.refreshCtl.endRefreshing()
            }
        }
    }
    

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.panGestureRecognizer.translation(in: scrollView).y < 0 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }

    
}

extension TabPageNewsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if firebaseModel.netStatus == true {
            return tableSection.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if firebaseModel.netStatus == true {
            if section == 0 {
                return firebaseModel.recommend.count
         
            } else if section == 1{
                return 1
            } else {
                return firebaseModel.articles.count
            }
            
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if firebaseModel.netStatus == true {
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "TopArticleTableViewCell") as! TopArticleTableViewCell
                let todayTop = firebaseModel.recommend[indexPath.row]

                cell.titleLabel.text = todayTop.title
                
                //                cell.titleLabel.text = articleModel.recommendArray[indexPath.row].title
                let imageURL = URL(string: todayTop.imageUrl)
                cell.thumbnail.sd_setImage(with: imageURL) {
                    image, error, cacheType, imageUrl in
                    if error != nil { return }
                    if image != nil && cacheType == .none {
                        cell.thumbnail.alpha = 0
                        UIView.animate(withDuration: 0.5, animations: {
                            cell.thumbnail.alpha = 1
                        })
                    }
                }
                cell.thumbnail.sd_setImage(with: imageURL)
                
//                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
//                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                return cell

            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
                cell.kerningLabel.text = "新着記事"
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                cell.selectionStyle = UITableViewCell.SelectionStyle.none
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell
                let article = firebaseModel.articles[indexPath.row]
//                cell.titleLabel.attributedText = articleModel.lineHeightSetting(targetText: article.title, lineHeight: 0)
                cell.titleLabel.text = article.title
                let createAt = " \(article.createAt)".prefix(11)
                cell.genreLabel.text = "\(article.genre)   \(createAt)"
                
                let imageURL = URL(string: article.imageUrl)
                cell.thumbnail.sd_setImage(with: imageURL) {
                    image, error, cacheType, imageUrl in
                    if error != nil { return }
                    if image != nil && cacheType == .none {
                        cell.thumbnail.alpha = 0
                        UIView.animate(withDuration: 0.5, animations: {
                            cell.thumbnail.alpha = 1
                        })
                    }
                }
                cell.thumbnail.sd_setImage(with: imageURL)
                cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NothingTableViewCell") as! NothingTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if firebaseModel.netStatus == true {
            switch indexPath.section {
            case 0:
                let detailVc = UIStoryboard(name: "DetailOfArticle", bundle: nil).instantiateViewController(withIdentifier: "DetailOfArticle") as! DetailOfArticleController
                let todayTop = firebaseModel.recommend[indexPath.row]
                detailVc.getUrl = todayTop.siteUrl
                detailVc.getTitle = todayTop.title
                let sendViews =  "\(Int(todayTop.views)! + 1)"
                firebaseModel.inputViewsFromRecomends(views: sendViews)
                self.navigationController?.pushViewController(detailVc, animated: true)
                
            case 1:
                print("")
                
            default:
                let detailVc = UIStoryboard(name: "DetailOfArticle", bundle: nil).instantiateViewController(withIdentifier: "DetailOfArticle") as! DetailOfArticleController
                let article = firebaseModel.articles[indexPath.row]
                detailVc.getUrl = article.siteUrl
                detailVc.getTitle = article.title
                let sendViews = "\(Int(article.views)! + 1)"
                let documentName = article.documentName
                firebaseModel.inputViewsFromArticles(document: documentName, views: sendViews)
        
                self.navigationController?.pushViewController(detailVc, animated: true)
                print("推してる")
            }
        } else {
            print("")
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
             print("this is the last cell")
//            let spinner = UIActivityIndicatorView(style: .gray)
//            spinner.startAnimating()
//            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
//
//            self.tableview.tableFooterView = spinner
//            self.tableview.tableFooterView?.isHidden = false
            firebaseModel.nextData {
                DispatchQueue.main.async {
                    self.tabpageView.tableView.reloadData()
                }
            }
        }
    }
    
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if firebaseModel.netStatus == true {
            switch indexPath.section {
            case 0:
                tableView.estimatedRowHeight = 378
                return UITableView.automaticDimension
            case 1:
                return 46
            default:
                tableView.estimatedRowHeight = 262
                return UITableView.automaticDimension
            }
            
        } else {
            return 399
        }
    }
    
    
}
