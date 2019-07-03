//
//  ModelFromFirebase.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/05/05.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import Foundation
import Firebase

class ModelFromFirebase {
    
    //cloudFireStoreの構造体
    struct Article {
        var title: String
        var genre: String
        var siteUrl: String
        var createAt: Date
        var imageUrl: String
        var views: String
        var documentName: String
    }
    
    struct Recommend {
        var title: String
        var siteUrl: String
        var imageUrl: String
        var views: String
    }
    
    
    var netStatus = true
    var articles = [Article]()
    var recommend = [Recommend]()
    var articleListener: ListenerRegistration?
    var nextSnapShot: QuerySnapshot?
    var nothingNewData = false
    
    
    
    //データ取得（最新１０件とレコメンド）
    func articleData(completion: @escaping () -> Void) {
        self.articleListener = Firestore.firestore().collection("articles").order(by: "createAt", descending: true).limit(to: 10).addSnapshotListener {(snapShot, error) in
            guard let value = snapShot else {
                //コレクション内のデータがあるか確認
                print("snapShot is nil")
                self.netStatus = false
                return
            }

            self.nextSnapShot = value
            self.netStatus = false
            
            self.articles = value.documents.map{ article -> Article in
                let data = article.data()
                print("データ取れてる？\(data)")
                self.netStatus = true
                let timestamp: Timestamp = data["createAt"] as! Timestamp
                return Article(title: data["title"] as! String, genre: data["genre"] as! String, siteUrl: data["siteUrl"] as! String, createAt: timestamp.dateValue(), imageUrl: data["imageUrl"] as! String, views: data["views"] as! String, documentName: data["document_name"] as! String)
            }
        }
            
        //レコメンド
        self.articleListener = Firestore.firestore().collection("recommends").addSnapshotListener {(snapShot, error) in
            guard let value = snapShot else {
                print("snapShot is nil")
                self.netStatus = false
                return
            }
            self.netStatus = false
            self.recommend = value.documents.map{ article -> Recommend in
                let data = article.data()
                self.netStatus = true
                return Recommend(title: data["title"] as! String, siteUrl: data["siteUrl"] as! String, imageUrl: data["imageUrl"] as! String, views: data["views"] as! String)
            }
            
            completion()
        }
        
    }
    
    
    //追加のデータを取得する

    func nextData(completion: @escaping () -> Void) {
        guard let lastSnapshot = nextSnapShot!.documents.last else {
            // The collection is empty.
            print("nothing")
            nothingNewData = true
            return
        }
   
        let next = Firestore.firestore().collection("articles")
            .order(by: "createAt", descending: true).limit(to: 5)
            .start(afterDocument: lastSnapshot)
        next.addSnapshotListener { (snapshot, error) in
            guard let nextSnapshot = snapshot else {
                print("Error retreving cities: \(error.debugDescription)")
                return
            }
             self.nextSnapShot = nextSnapshot
            self.articles += nextSnapshot.documents.map{ article -> Article in
                let data = article.data()
                print("データ取れてる？\(data)")
            
                let timestamp: Timestamp = data["createAt"] as! Timestamp
                return Article(title: data["title"] as! String, genre: data["genre"] as! String, siteUrl: data["siteUrl"] as! String, createAt: timestamp.dateValue(), imageUrl: data["imageUrl"] as! String, views: data["views"] as! String, documentName: data["document_name"] as! String)
            }
             completion()
        }
    }
    
    
    
    
    //viewsユーザーが見た数(データ書き込み)
    func inputViewsFromArticles(document: String, views: String) {
        var defaultStore : Firestore!
        defaultStore = Firestore.firestore()
  
        let ref = defaultStore.collection("articles").document(document)
    
        ref.updateData(["views" : views]){ err in
            if let err  = err {
                print("Error update document: \(err)")
            }else{
                print("Document successfully update")
            }
        }
    }
    
    
    func inputViewsFromRecomends(views: String) {
        var defaultStore : Firestore!
        defaultStore = Firestore.firestore()
        
        let ref = defaultStore.collection("recommends").document("todayRecomend")
        
        ref.updateData(["views" : views]){ err in
            if let err  = err {
                print("Error update document: \(err)")
            }else{
                print("Document successfully update")
            }
        }
    }
    
    
}
