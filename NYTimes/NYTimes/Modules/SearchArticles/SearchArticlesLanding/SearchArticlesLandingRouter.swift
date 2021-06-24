// 
//  SearchArticlesLandingRouter.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

class SearchArticlesLandingRouter: SearchArticlesLandingPresenterToRouter {
    
    // MARK: - Properties
    private let configurator: Configurator
    
    // MARK: - Init
    init(configurator: Configurator = .shared) {
        self.configurator = configurator
    }
    
    func navigateToArticleDetails(from view: SearchArticlesLandingPresenterToView?, type: ArticleType, searchResponse: [SearchDocModel]) {
        DispatchQueue.main.async {
            if let searchView = view as? UIViewController {
                let articleListView = self.configurator.createArticlesListModule(type: type, searchResponse: searchResponse)
                searchView.navigationController?.pushViewController(articleListView, animated: true)
            }
        }
    }
    
}
