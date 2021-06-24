//
//  ErrorResponse.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

public struct ErrorResponse: Codable {
    public let code: Int
    public let info: String
}

