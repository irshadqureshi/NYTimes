// 
//  DashboardLandingRouter.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

class DashboardLandingRouter: DashboardLandingPresenterToRouter {
    
    // MARK: - Properties
    private let configurator: Configurator
    
    // MARK: - Init
    init(configurator: Configurator = .shared) {
        self.configurator = configurator
    }
    
    func navigateToSearch(from view: DashboardLandingPresenterToView?) {
        DispatchQueue.main.async {
            if let dashboardView = view as? UIViewController {
                let searchView = self.configurator.createSearchArticlesLandingModule()
                dashboardView.navigationController?.pushViewController(searchView, animated: true)
            }
        }
    }
    
    func navigateToArticleDetail(from view: DashboardLandingPresenterToView?, type: ArticleType) {
        DispatchQueue.main.async {
            if let dashboardView = view as? UIViewController {
                let articleListView = self.configurator.createArticlesListModule(type: type)
                dashboardView.navigationController?.pushViewController(articleListView, animated: true)
            }
        }
    }
    
}
