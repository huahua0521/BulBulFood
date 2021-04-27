//
//  FoodFile.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/27.
//

import Foundation

struct FoodBody: Codable {
    let records: [FoodField]
}

struct FoodField: Codable {
    let id : String
    let fields : FoodData
//    let createdTime :Date
}

struct FoodData: Codable {
    //記得若無資料要加optional否則會失敗
    let name : String
    let description : String?
    let image : [FoodImage]?
    let rating : Int?
}

struct FoodImage: Codable {
    let url: URL
}
