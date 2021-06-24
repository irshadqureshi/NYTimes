//
//  Constant.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation
class Constants: NSObject {
    
    struct WebService{
        static let accessKey                    =  "api-key=gd5WA6yh2J6yEBHHUsUL1STf2GozG7Rd"
        static let baseUrl                      =  "https://api.nytimes.com/svc"
        static let getSearchAPI                 =  "/search/v2/articlesearch.json"
        static let getMostViewedAPI             =  "/mostpopular/v2/viewed/1.json"
        static let getMostSharedAPI             =  "/mostpopular/v2/shared/1/facebook.json"
        static let getMostEmailedAPI            =  "/mostpopular/v2/emailed/7.json"

        
    }
    
    struct Identifiers{
        static let sectionTableViewCell         =  "SectionTableViewCell"
        static let homeTableViewCell            =  "HomeTableViewCell"
        static let listTableViewCell            =  "ListTableViewCell" 
    }
}
