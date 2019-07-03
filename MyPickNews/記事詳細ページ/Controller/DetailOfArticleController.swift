//
//  DetailOfArticleController.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/09.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import UIKit
import WebKit

class DetailOfArticleController: UIViewController {

    let detailOfArticleView = DetailOfArticleView.instance()
    let errorFromNetView = ErrorFromNetView.instance()
    var getUrl = ""
    var getTitle = ""
    var activityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        detailOfArticleView.frame = self.view.frame
        self.view.addSubview(detailOfArticleView)
        openUrl(urlsting: getUrl)
        detailOfArticleView.wkWebView.navigationDelegate = self
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = UIColor(hex: "660066")
        view.addSubview(activityIndicatorView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
        // ナビゲーションバーのアイテムの色　（戻る　＜　とか　読み込みゲージとか）
        self.navigationController?.navigationBar.tintColor = .black
        navigationItem.title = getTitle
        
         self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
    }
    
    func openUrl(urlsting: String) {
        let url = URL(string: urlsting)
        let urlRequest = URLRequest(url: url!)
        detailOfArticleView.wkWebView.load(urlRequest)
    }
    
}
extension DetailOfArticleController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicatorView.alpha = 1
        activityIndicatorView.startAnimating()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorView.alpha = 0
        activityIndicatorView.stopAnimating()
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        let error = error as NSError
        
        if error.code == -1009 {
            print("NotConnectedToInternet")
            activityIndicatorView.alpha = 0
            activityIndicatorView.stopAnimating()
            errorFromNetView.frame = self.view.frame
            self.view.addSubview(errorFromNetView)
        }
    }
    
}
