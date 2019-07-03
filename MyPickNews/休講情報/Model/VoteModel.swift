//
//  VoteModel.swift
//  MyPickNews
//
//  Created by 中重歩夢 on 2019/04/21.
//  Copyright © 2019 Ayumu Nakashige. All rights reserved.
//

import Foundation
import UIKit

class VoteModel {
    
    var voteValueArray = [VoteObjects]()
    var vacantString = ""
    var subtleString = ""
    var noVacantString = ""
    var networkStatus = false
    
    //投票の値API
    func voteData(completion: @escaping () -> Void) {
        let urlString = "http://0.0.0.0:8000/api/AvailableDr/"
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil, response != nil else {
                print("something is wrong")
                return
            }
            print("downloaded")
            let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
            print(string1)
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let getMyApiData:  VoteList = try decoder.decode(VoteList.self, from: data)
                self.voteValueArray = getMyApiData.results
                self.vacantString = (self.voteValueArray[0].vacantValue)
                self.subtleString = (self.voteValueArray[0].subtleValue)
                self.noVacantString = (self.voteValueArray[0].noVacantValue)
                self.networkStatus = true
//                 let getMyApiData:  VoteObjects = try decoder.decode(VoteObjects.self, from: data)
//                self.voteValueArray = [getMyApiData]
                
                completion()
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            }.resume()
    }
    
    func voteUpdate(vacantValue: String,subtleValue: String, noVacantValue: String, completion: @escaping () -> Void) {
        let urlString = "http://0.0.0.0:8000/api/AvailableDr/5/"
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String: String] = [
            "vacant_value": "\(vacantValue)",
            "subtle_value": "\(subtleValue)",
            "no_vacant_value": "\(noVacantValue)"
        ]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil, response != nil else {
                print("something is wrong")
                return
            }
            print("downloadedddddddd")
            let string1 = String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed"
            print(string1)
            let decoder: JSONDecoder = JSONDecoder()
            do {
                //                let getMyApiData:  VoteList = try decoder.decode(VoteList.self, from: data)
                //                self.voteValueArray = getMyApiData.results
                let getMyApiData:  VoteObjects = try decoder.decode(VoteObjects.self, from: data)
                self.voteValueArray = [getMyApiData]
                self.networkStatus = true
                
                completion()
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            }.resume()
    }
}
