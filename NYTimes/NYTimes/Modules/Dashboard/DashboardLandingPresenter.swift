//
//  DashboardLandingPresenter.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

class DashboardLandingPresenter: DashboardLandingViewToPresenter {
    
    weak var view: DashboardLandingPresenterToView?
    var interactor: DashboardLandingPresenterToInteractor?
    var router: DashboardLandingPresenterToRouter?
    
    var sectionCellViewModel: DashboardSectionCellViewModel?
    var cellViewModel: DashboardCellViewModel?
    
    func viewDidload() {
        
    }
    
}

typealias DashboardTableDataSource = DashboardLandingPresenter
extension DashboardTableDataSource {
    func numberOfSections() -> Int {
        2
    }
    
    func numberOfRows(in section: Int) -> Int {
        section == 0 ? 1 : 3
    }
    
    func viewForHeader(in section: Int) -> HomeSectionCellViewModel? {
        sectionCellViewModel = DashboardSectionCellViewModel(section: section)
        return sectionCellViewModel
    }
    
    func model(for index: IndexPath) -> HomeCellViewModel? {
        cellViewModel = DashboardCellViewModel(indexPath: index)
        return cellViewModel
    }
    
}

typealias DashboardTableDelegate = DashboardLandingPresenter
extension DashboardTableDelegate {
    func selectedModel(for index: IndexPath) {
        if index.section == 1 {
            router?.navigateToArticleDetail(from: view, type: index.row == 0 ? .mostViewed : index.row == 1 ? .mostShared : .mostEmailed)
        }else{
            router?.navigateToSearch(from: view)
        }
    }
}

extension DashboardLandingPresenter: DashboardLandingInteractorToPresenter {
    
}
