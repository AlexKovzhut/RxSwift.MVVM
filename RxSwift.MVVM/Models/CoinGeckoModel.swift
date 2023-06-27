//
//  CoinGeckoModel.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 27.06.2023.
//

typealias ListModels = [ListModelElement]

struct ListModelElement {
    
    let name: String
    
    init(codable: APINinjasElement) {
        self.name = codable.name
    }
    
    init(name: String) {
        self.name = name
    }
    
    init() {
        self.name = ""
    }
}
