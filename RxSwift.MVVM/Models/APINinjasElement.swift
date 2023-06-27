//
//  APICitiesResponse.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 26.06.2023.
//

import Foundation

typealias APICitiesResponse = [APINinjasElement]

struct APINinjasElement: Codable {
    let name: String

    enum CodingKeys: String, CodingKey {
        case name
    }
}
