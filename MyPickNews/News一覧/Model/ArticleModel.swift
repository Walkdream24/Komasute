//
//  ArticleModel.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/19.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import Foundation
import UIKit

class ArticleModel {
    
    func lineHeightSetting(targetText: String, lineHeight: Float) -> NSMutableAttributedString {
        let LineHeightStyle = NSMutableParagraphStyle()
        LineHeightStyle.lineSpacing = CGFloat(lineHeight)
        let lineHeightAttr = [NSAttributedString.Key.paragraphStyle: LineHeightStyle]
        return NSMutableAttributedString(string: targetText, attributes: lineHeightAttr)
    }
    
//     var recommendArray = [RecommendList]()
//    var articleArray = [NewsObjects]()
//    var networkStatus = false
//
//    //おすすめ記事（一番上に表示される大きい記事）のapi
//    func recommendData(completion: @escaping () -> Void) {
//        let urlString = "http://0.0.0.0:8000/api/recommend/"
//        var request = URLRequest(url: URL(string: urlString)!)
//        request.httpMethod = "GET"
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data, error == nil, response != nil else {
//                print("something is wrong")
//                return
//            }
//            print("downloaded")
//            let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
//            print(string1)
//            let decoder: JSONDecoder = JSONDecoder()
//            do {
//                let getMyApiData: Recommend = try decoder.decode(Recommend.self, from: data)
//                self.recommendArray = getMyApiData.results
//                self.networkStatus = true
//
//                completion()
//            } catch let DecodingError.dataCorrupted(context) {
//                print(context)
//            } catch let DecodingError.keyNotFound(key, context) {
//                print("Key '\(key)' not found:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch let DecodingError.valueNotFound(value, context) {
//                print("Value '\(value)' not found:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch let DecodingError.typeMismatch(type, context)  {
//                print("Type '\(type)' mismatch:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch {
//                print("error: ", error)
//            }
//            }.resume()
//    }
//
//    //記事リストApi
//    func articleData(completion: @escaping () -> Void) {
//        let urlString = "http://0.0.0.0:8000/api/entries/"
//        var request = URLRequest(url: URL(string: urlString)!)
//        request.httpMethod = "GET"
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            guard let data = data, error == nil, response != nil else {
//                print("something is wrong")
//                return
//            }
//            print("downloaded")
//            let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
//            print(string1)
//            let decoder: JSONDecoder = JSONDecoder()
//            do {
//                let getMyApiData: ArticleList = try decoder.decode(ArticleList.self, from: data)
//                self.articleArray = getMyApiData.results
//                self.networkStatus = true
//
//                completion()
//            } catch let DecodingError.dataCorrupted(context) {
//                print(context)
//            } catch let DecodingError.keyNotFound(key, context) {
//                print("Key '\(key)' not found:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch let DecodingError.valueNotFound(value, context) {
//                print("Value '\(value)' not found:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch let DecodingError.typeMismatch(type, context)  {
//                print("Type '\(type)' mismatch:", context.debugDescription)
//                print("codingPath:", context.codingPath)
//            } catch {
//                print("error: ", error)
//            }
//            }.resume()
//    }
}
