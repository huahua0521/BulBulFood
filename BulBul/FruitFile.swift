//
//  FruitFile.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/23.
//

import Foundation


struct FruitBody: Codable {
    let records: [FruitField]
}

struct FruitField: Codable {
    let id : String
    let fields : FruitData
//    let createdTime :Date
}

struct FruitData: Codable {
    //記得若無資料要加optional否則會失敗
    let fruitName : String
    let desc : String?
    let image : [FruitImag]?
    let rating : Int?
}

struct FruitImag: Codable {
    let url: URL
}



