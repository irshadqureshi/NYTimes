// 
//  ArticlesListProtocols.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

// MARK: View -
protocol ArticlesListPresenterToView: class {
    var presenter: ArticlesListViewToPresenter? { get set }
    
    func reloadView()
    func showLoader(isShowing: Bool)
    func showAlert(titleStr: String?, messageStr: String?)
}

// MARK: Interactor -
protocol ArticlesListPresenterToInteractor: class {
    var presenter: ArticlesListInteractorToPresenter? { get set }
    
    func getEmailedList()
    func getSharedList()
    func getViewedList()
}

// MARK: Router -
protocol ArticlesListPresenterToRouter: class {
}

// MARK: Presenter -
protocol ArticlesListViewToPresenter: class {
    var view: ArticlesListPresenterToView? { get set }
    var interactor: ArticlesListPresenterToInteractor? { get set }
    var router: ArticlesListPresenterToRouter? { get set }
    
    var type: ArticleType? { get set }
    var searchResponseModel: [SearchDocModel]? { get set }
    
    func viewDidload()
    func getTitle() -> String
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func model(for index: IndexPath) -> ArticleListCellViewModel?
}

protocol ArticlesListInteractorToPresenter: class {
    func didSuccessMostEmailed(response: MostEmailedModel)
    func didFailedMostEmailed(with error: ErrorResponse?)
    
    func didSuccessMostViewed(response: MostViewedModel)
    func didFailedMostViewed(with error: ErrorResponse?)
    
    func didSuccessMostShared(response: MostSharedModel)
    func didFailedMostShared(with error: ErrorResponse?)
}
