//
//  BaseRouter.swift
//  RickAndMorty
//
//  Created by Adilet on 3/6/25.
//

import Foundation

protocol BaseRouter {
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameter: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeader: [HttpHeader]? { get }
}

extension BaseRouter {
    
    var userDefaultsService: UserDefaultsService {
        return UserDefaultsService()
    }
    var host: String {
        return "rickandmortyapi.com"
    }
    var scheme: String {
        return "https"
    }
    func createURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameter
        guard let url = urlComponents.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        let stringURL = url.absoluteString.replacingOccurrences(of: ";", with: ":")
        var urlRequest = URLRequest(url: URL(string: stringURL)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody
        httpHeader?.forEach { (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        print(url)
        
        let userDefaultsService = UserDefaultsService.shared
       
//        urlRequest.setValue("Bearer \(userDefaultsService.getByKey(key: .access))", forHTTPHeaderField: "Authorization" )
 
        return urlRequest
    }
}

protocol BaseRouterLogin {
    var path: String { get }
    var method: HttpMethod { get }
    var queryParameter: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeader: [HttpHeader]? { get }
}

extension BaseRouterLogin {

    var userDefaultsService: UserDefaultsService {
        return UserDefaultsService()
    }
    var host: String {
        return "34.16.141.84"
    }
    var scheme: String {
        return "http"
    }
    func createURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameter
        guard let url = urlComponents.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        let stringURL = url.absoluteString.replacingOccurrences(of: ";", with: ":")
        var urlRequest = URLRequest(url: URL(string: stringURL)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpBody = httpBody
        httpHeader?.forEach { (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        print(urlRequest.httpMethod, urlRequest.url?.absoluteString)
        return urlRequest
    }
}


