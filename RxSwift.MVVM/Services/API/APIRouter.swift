//
//  APIRouter.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 26.06.2023.
//

import Foundation
import Alamofire

struct API {
    
    struct ProductionServer {
        static let baseURL = "https://api.api-ninjas.com"
    }
    
    struct APIKey {
        static let key = "X-Api-Key"
        static let value = "99ztKkraGeVzUHgIm3lSQQ==uYLeHtuVNJfVdUEr"
    }
}

enum APIRouter: APIConfiguration {
    
    case countryList(limit: Int)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        return .get
    }
    
    // MARK: - Path
    var path: String {
        return "/v1/country"
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        case .countryList(let limit):
            return [
                "limit": limit
            ]
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try API.ProductionServer.baseURL.asURL()
        
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue("99ztKkraGeVzUHgIm3lSQQ==uYLeHtuVNJfVdUEr", forHTTPHeaderField: "X-Api-Key")
        
        switch self {
        case .countryList:
            var components = URLComponents(string: url.appendingPathComponent(path).absoluteString)
            components?.queryItems = [
                URLQueryItem(name: "limit", value: "15")
            ]
            urlRequest.url = components?.url
        }
        
        return urlRequest
    }
}
