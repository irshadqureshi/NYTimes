//
//  APIManager.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation
import UIKit

public enum HttpMethod: String {
    case post = "POST"
    case get  = "GET"
}

public class APIManager: NSObject {
    
    public static let sharedInstance: APIManager = APIManager()
    
    private override init() {}
    
    public func requestApi(httpMethod: HttpMethod = .get, apiUrl: String, params: String?, handler: @escaping (Data?, URLResponse?, Error?)-> Void) {
        
        if let url = URL.with(string: apiUrl, param: params) {
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod.rawValue
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let HTTPHeaderField_ContentType  = "Content-Type"
            let ContentType_ApplicationJson  = "application/json"
            urlRequest.timeoutInterval = 60.0
            urlRequest.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
            urlRequest.addValue(ContentType_ApplicationJson, forHTTPHeaderField: HTTPHeaderField_ContentType)
            
            print(urlRequest)
            
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                handler(data, response, error)
            }
            dataTask.resume()
        }
    }
}

