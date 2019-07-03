//
//  kyukouModel.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/05/15.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class KyukouModel {
    
    struct Kyukou {
        var professorList: [String]
        var classNum: [String]
        var today: String
    }
    
    var professorList:[String] = []
    var classNum: [String] = []
    var kyukou:[Kyukou] = []
    var kyukouListener: ListenerRegistration?
    var today: String = ""
    var netStatus = true

    
    
    func getKyukouData(completion: @escaping () -> Void) {
        self.kyukouListener = Firestore.firestore().collection("kyukou").addSnapshotListener {(snapShot, error) in
            guard let value = snapShot else {
                print("snapShot is nil")
                self.netStatus = false
                return
            }
            self.netStatus = false
            self.kyukou = value.documents.map{ info -> Kyukou in
                let data = info.data()
                self.netStatus = true
                self.professorList = data["professor_list"] as! [String]
                self.classNum = data["class_num"] as! [String]
                self.today = data["today"] as! String
                return Kyukou(professorList: data["professor_list"] as! [String], classNum: data["class_num"] as! [String], today: data["today"] as! String)
            }
            completion()
        }
    }
    
    
    

    
    //データ取得
    func kyukouData() {
        let db = Firestore.firestore()
        let docRef = db.collection("kyukou").document("kyukou1")
        
        docRef.getDocument { (document, error) in
            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }
//            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//            print("Document data: \(dataDescription)")

        }
        
    }
}
