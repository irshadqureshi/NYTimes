//
//  SearchArticlesLandingPresenter.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

public enum ArticleType: String{
    case mostViewed = "Most Viewed"
    case mostShared = "Most Shared"
    case mostEmailed = "Most Emailed"
    case searchArticles = "Search Articles"
}

class SearchArticlesLandingPresenter: SearchArticlesLandingViewToPresenter {

    weak var view: SearchArticlesLandingPresenterToView?
    var interactor: SearchArticlesLandingPresenterToInteractor?
    var router: SearchArticlesLandingPresenterToRouter?
    
    func viewDidload(){
        
    }
    
    func searchTapped(searchText: String) {
        interactor?.getSearchResults(for: searchText)
    }
}

extension SearchArticlesLandingPresenter: SearchArticlesLandingInteractorToPresenter {
    func didSuccessSearchResult(response: SearchModel) {
        view?.showLoader(isShowing: false)
        router?.navigateToArticleDetails(from: view, type: .searchArticles, searchResponse: response.response?.docs.map{ $0 } ?? [])
    }
    
    func didFailedSearchResult(with error: ErrorResponse?) {
        guard let error = error else { return }
        view?.showLoader(isShowing: false)
        view?.showAlert(titleStr: "Alert", messageStr: "\(error.info)")
    }
}
