//
//  Worker.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

public class Worker: WorkerProtocol {

    // MARK: - Properties
    public var mostViewedDelegate: GetMostViewedProtocol?
    public var mostSharedDelegate: GetMostSharedProtocol?
    public var mostEmailedDelegate: GetMostEmailedProtocol?
    public var searchResultDelegate: GetSearchResultProtocol?
    public let apiManager: APIManager
    
    // MARK: - Initialization
    public init (apiManager: APIManager = APIManager.sharedInstance) {
        self.apiManager = apiManager
    }
    
    // MARK: - WorkerProtocol
    
    public func getMostViewed() {
        self.apiManager.requestApi(
            apiUrl: Constants.WebService.getMostViewedAPI,
            params: nil,
            handler: {data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(MostViewedModel.self, from: data)
                        self.mostViewedDelegate?.didSuccessMostViewed(response: response)
                    } catch let error {
                        print(error)
                        self.mostViewedDelegate?.didFailedMostViewed(with: ErrorResponse(code: -1, info: "Something went wrong"))
                    }
                }
            })
        }
    
    public func getMostShared() {
        self.apiManager.requestApi(
            apiUrl: Constants.WebService.getMostSharedAPI,
            params: nil,
            handler: {data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(MostSharedModel.self, from: data)
                        self.mostSharedDelegate?.didSuccessMostShared(response: response)
                    } catch let error {
                        print(error)
                        self.mostSharedDelegate?.didFailedMostShared(with: ErrorResponse(code: -1, info: "Something went wrong"))
                    }
                }
            })
    }
    
    public func getMostEmailed() {
        self.apiManager.requestApi(
            apiUrl: Constants.WebService.getMostEmailedAPI,
            params: nil,
            handler: {data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(MostEmailedModel.self, from: data)
                        self.mostEmailedDelegate?.didSuccessMostEmailed(response: response)
                    } catch let error {
                        print(error)
                        self.mostEmailedDelegate?.didFailedMostEmailed(with: ErrorResponse(code: -1, info: "Something went wrong"))
                    }
                }
            })
    }
    
    public func getSearchResults(searchText: String) {
        self.apiManager.requestApi(
            apiUrl: Constants.WebService.getSearchAPI,
            params: "q=\(searchText)",
            handler: {data, response, error in
                if let data = data {
                    do {
                        let response = try JSONDecoder().decode(SearchModel.self, from: data)
                        self.searchResultDelegate?.didSuccessSearchResult(response: response)
                    } catch let error {
                        print(error)
                        self.searchResultDelegate?.didFailedSearchResult(with: ErrorResponse(code: -1, info: "Something went wrong"))
                    }
                }
            })
    }
    
    
    
    
}
