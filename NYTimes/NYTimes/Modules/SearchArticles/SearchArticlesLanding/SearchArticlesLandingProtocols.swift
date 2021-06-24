// 
//  SearchArticlesLandingProtocols.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

// MARK: View -
protocol SearchArticlesLandingPresenterToView: class {
    var presenter: SearchArticlesLandingViewToPresenter? { get set }
    
    func showLoader(isShowing: Bool)
    func showAlert(titleStr: String?, messageStr: String?)
}

// MARK: Interactor -
protocol SearchArticlesLandingPresenterToInteractor: class {
    var presenter: SearchArticlesLandingInteractorToPresenter? { get set }
    
    func getSearchResults(for searchText: String)
}

// MARK: Router -
protocol SearchArticlesLandingPresenterToRouter: class {
    func navigateToArticleDetails(from view: SearchArticlesLandingPresenterToView?, type: ArticleType, searchResponse: [SearchDocModel])
}

// MARK: Presenter -
protocol SearchArticlesLandingViewToPresenter: class {
    var view: SearchArticlesLandingPresenterToView? { get set }
    var interactor: SearchArticlesLandingPresenterToInteractor? { get set }
    var router: SearchArticlesLandingPresenterToRouter? { get set }
    
    func viewDidload()
    func searchTapped(searchText: String)
}

protocol SearchArticlesLandingInteractorToPresenter: class {
    func didSuccessSearchResult(response: SearchModel)
    func didFailedSearchResult(with error: ErrorResponse?)
}
