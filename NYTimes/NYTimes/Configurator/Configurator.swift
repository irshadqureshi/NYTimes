//
//  Configurator.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

public class Configurator {
    public static var shared = Configurator()

     public func createDashboardLandingModule() -> UIViewController {
         let view: UIViewController & DashboardLandingPresenterToView = DashboardLandingView()
         let presenter: DashboardLandingViewToPresenter & DashboardLandingInteractorToPresenter = DashboardLandingPresenter()
        let interactor: DashboardLandingPresenterToInteractor = DashboardLandingInteractor()
         let router: DashboardLandingPresenterToRouter = DashboardLandingRouter()
        
         view.presenter = presenter
         presenter.view = view
         presenter.router = router
         presenter.interactor = interactor
         interactor.presenter = presenter
        
         return view
     }
    
    public func createSearchArticlesLandingModule() -> UIViewController {
        let view: UIViewController & SearchArticlesLandingPresenterToView = SearchArticlesLandingView()
        let presenter: SearchArticlesLandingViewToPresenter & SearchArticlesLandingInteractorToPresenter = SearchArticlesLandingPresenter()
        let worker:WorkerProtocol = Worker()
        let interactor: SearchArticlesLandingPresenterToInteractor = SearchArticlesLandingInteractor(worker: worker)
        let router: SearchArticlesLandingPresenterToRouter = SearchArticlesLandingRouter()
       
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
       
        return view
    }
    
    public func createArticlesListModule(type: ArticleType, searchResponse: [SearchDocModel]? = nil) -> UIViewController {
        let view: UIViewController & ArticlesListPresenterToView = ArticlesListView()
        let presenter: ArticlesListViewToPresenter & ArticlesListInteractorToPresenter = ArticlesListPresenter()
        let worker:WorkerProtocol = Worker()
        let interactor: ArticlesListPresenterToInteractor = ArticlesListInteractor(worker: worker)
        let router: ArticlesListPresenterToRouter = ArticlesListRouter()
       
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.type = type
        presenter.searchResponseModel = searchResponse
        interactor.presenter = presenter
       
        return view
    }
}
