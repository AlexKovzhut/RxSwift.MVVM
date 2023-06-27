//
//  NetworkLogger.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 26.06.2023.
//

import Foundation
import Alamofire

class NetworkLogger: EventMonitor {
    
    func requestDidFinish(_ request: Request) {
        print(request.description)
    }
    
    func request<Value>(_ request: DataRequest, didParseReponse response: DataResponse<Value, AFError>) {
        guard let data = response.data else { return }
        
        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
            print(json)
        }
    }
}
