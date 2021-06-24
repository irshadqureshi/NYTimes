// 
//  SearchArticlesLandingInteractor.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

class SearchArticlesLandingInteractor: SearchArticlesLandingPresenterToInteractor {

    weak var presenter: SearchArticlesLandingInteractorToPresenter?
    var worker: WorkerProtocol?

    init(worker: WorkerProtocol) {
        self.worker = worker
    }

    func getSearchResults(for searchText: String) {
        self.worker?.searchResultDelegate = self
        self.worker?.getSearchResults(searchText: searchText)
    }
    
}

extension SearchArticlesLandingInteractor:  GetSearchResultProtocol {
    
    func didSuccessSearchResult(response: SearchModel){
        presenter?.didSuccessSearchResult(response: response)
    }
    
    func didFailedSearchResult(with error: ErrorResponse?){
        presenter?.didFailedSearchResult(with: error)
    }
}
