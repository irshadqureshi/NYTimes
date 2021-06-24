//
//  ArticlesListPresenter.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

class ArticlesListPresenter: ArticlesListViewToPresenter {
    weak var view: ArticlesListPresenterToView?
    var interactor: ArticlesListPresenterToInteractor?
    var router: ArticlesListPresenterToRouter?
    
    var type: ArticleType?
    var searchResponseModel: [SearchDocModel]?
    var mostViewedResponseModel: [MostViewedResultModel]?
    var mostSharedResponseModel: [MostSharedResultModel]?
    var mostEmailedResponseModel: [MostEmailedResultModel]?
    
    var searchedArticlesViewModel: SearchedArticlesCellViewModel?
    var mostViewedViewModel: MostViewedCellViewModel?
    var mostEmailedViewModel: MostEmailedCellViewModel?
    var mostSharedViewModel: MostSharedCellViewModel?

    private var screenTitle: String = ""
    
    func viewDidload() {
        view?.showLoader(isShowing: true)
        switch type {
        case .mostShared:
            screenTitle = type?.rawValue ?? "Most Shared"
            interactor?.getSharedList()
            break
        case .mostEmailed:
            screenTitle = type?.rawValue ?? "Most Emailed"
            interactor?.getEmailedList()
            break
        case .mostViewed:
            screenTitle = type?.rawValue ?? "Most Viewed"
            interactor?.getViewedList()
            break
        default:
            view?.showLoader(isShowing: false)
            screenTitle = type?.rawValue ?? "Search Articles"
            break
        }
    }
    
    func getTitle() -> String {
        screenTitle
    }
}

typealias ArticlesListTableDataSource = ArticlesListPresenter
extension ArticlesListTableDataSource {
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        switch type {
        case .mostShared:
            return mostSharedResponseModel?.count ?? 0
            
        case .mostEmailed:
            return mostEmailedResponseModel?.count ?? 0
            
        case .mostViewed:
            return mostViewedResponseModel?.count ?? 0
            
        default:
            return searchResponseModel?.count ?? 0
        }
    }
    
    func model(for index: IndexPath) -> ArticleListCellViewModel? {
        switch type {
        case .mostShared:
            guard let model = mostSharedResponseModel else { return nil }
            return MostSharedCellViewModel(model: model[index.row])
            
        case .mostEmailed:
            guard let model = mostEmailedResponseModel else { return nil }
            return MostEmailedCellViewModel(model: model[index.row])
            
        case .mostViewed:
            guard let model = mostViewedResponseModel else { return nil }
            return MostViewedCellViewModel(model: model[index.row])
            
        default:
            guard let model = searchResponseModel else { return nil }
            return SearchedArticlesCellViewModel(model: model[index.row])
        }
    }
}


typealias MostEmailedArticleList = ArticlesListPresenter

extension MostEmailedArticleList: ArticlesListInteractorToPresenter {
    func didSuccessMostEmailed(response: MostEmailedModel) {
        view?.showLoader(isShowing: false)
        mostEmailedResponseModel = response.results.map{ $0 }
        view?.reloadView()
    }
    
    func didFailedMostEmailed(with error: ErrorResponse?) {
        guard let error = error else { return }
        view?.showLoader(isShowing: false)
        view?.showAlert(titleStr: "Alert", messageStr: "\(error.info)")
    }
}


typealias MostViewedArticleList = ArticlesListPresenter

extension MostViewedArticleList {
    func didSuccessMostViewed(response: MostViewedModel) {
        view?.showLoader(isShowing: false)
        mostViewedResponseModel = response.results.map{ $0 }
        view?.reloadView()
    }
    
    func didFailedMostViewed(with error: ErrorResponse?) {
        guard let error = error else { return }
        view?.showLoader(isShowing: false)
        view?.showAlert(titleStr: "Alert", messageStr: "\(error.info)")
    }
}


typealias MostSharedArticleList = ArticlesListPresenter

extension MostSharedArticleList {
    func didSuccessMostShared(response: MostSharedModel) {
        view?.showLoader(isShowing: false)
        mostSharedResponseModel = response.results.map{ $0 }
        view?.reloadView()
    }
    
    func didFailedMostShared(with error: ErrorResponse?) {
        guard let error = error else { return }
        view?.showLoader(isShowing: false)
        view?.showAlert(titleStr: "Alert", messageStr: "\(error.info)")
    }
}
