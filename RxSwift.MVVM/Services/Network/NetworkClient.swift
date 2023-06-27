//
//  NetworkClient.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 27.06.2023.
//

import Foundation

class NetworkClient: APIClient {
    
    static func getList() -> Observable<APICitiesResponse> {
        return request(APIRouter.countryList(limit: 15))
    }
}
