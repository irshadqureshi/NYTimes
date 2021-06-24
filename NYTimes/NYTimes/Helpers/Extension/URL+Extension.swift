//
//  URL+Extension.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

extension URL {
    private static var baseUrl: String {
        return Constants.WebService.baseUrl
    }
    
    private static var accessKey: String {
        return Constants.WebService.accessKey
    }
    
    static func with(string: String, param: String? = nil) -> URL? {
        var url = "\(baseUrl)\(string)?\(accessKey)"
        if let param = param {
            url += "&\(param)"
        }
        return URL(string: url)
    }
    
}
