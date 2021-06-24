//
//  WorkerProtocol.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation
public protocol GetMostViewedProtocol: class {
    func didSuccessMostViewed(response: MostViewedModel)
    func didFailedMostViewed(with error: ErrorResponse?)
}

public protocol GetMostSharedProtocol: class {
    func didSuccessMostShared(response: MostSharedModel)
    func didFailedMostShared(with error: ErrorResponse?)
}

public protocol GetMostEmailedProtocol: class {
    func didSuccessMostEmailed(response: MostEmailedModel)
    func didFailedMostEmailed(with error: ErrorResponse?)
}

public protocol GetSearchResultProtocol: class {
    func didSuccessSearchResult(response: SearchModel)
    func didFailedSearchResult(with error: ErrorResponse?)
}

public protocol WorkerProtocol: class {
    var mostViewedDelegate : GetMostViewedProtocol? {get set}
    var mostSharedDelegate : GetMostSharedProtocol? {get set}
    var mostEmailedDelegate : GetMostEmailedProtocol? {get set}
    var searchResultDelegate : GetSearchResultProtocol? {get set}
    
    func getMostViewed()
    func getMostShared()
    func getMostEmailed()
    func getSearchResults(searchText: String)
}

