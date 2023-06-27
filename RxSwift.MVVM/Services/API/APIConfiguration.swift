//
//  APIConfiguration.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 26.06.2023.
//

import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "Application/json"
    case formEncode = "application/x-www-form-urlencoded"
}

enum APIError: Error {
    case noDecoded              // 200
    case noContent              // 204
    case badRequest             // 400
    case unauthorized           // 401
    case forbidden              // 403
    case notFound               // 404
    case noAllowed              // 405
    case conflict               // 409
    case internalServerError    // 500
}
