// 
//  DashboardLandingProtocols.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

// MARK: View -
protocol DashboardLandingPresenterToView: class {
    var presenter: DashboardLandingViewToPresenter? { get set }
}

// MARK: Interactor -
protocol DashboardLandingPresenterToInteractor: class {
    var presenter: DashboardLandingInteractorToPresenter? { get set }
}

// MARK: Router -
protocol DashboardLandingPresenterToRouter: class {
    func navigateToSearch(from view: DashboardLandingPresenterToView?)
    func navigateToArticleDetail(from view: DashboardLandingPresenterToView?, type: ArticleType)
}

// MARK: Presenter -
protocol DashboardLandingViewToPresenter: class {
    var view: DashboardLandingPresenterToView? { get set }
    var interactor: DashboardLandingPresenterToInteractor? { get set }
    var router: DashboardLandingPresenterToRouter? { get set }
    
    func viewDidload()
    func numberOfSections() -> Int
    func viewForHeader(in section: Int) -> HomeSectionCellViewModel?
    func numberOfRows(in section: Int) -> Int
    func model(for index: IndexPath) -> HomeCellViewModel?
    func selectedModel(for index: IndexPath)
}

protocol DashboardLandingInteractorToPresenter: class {
}
