// 
//  ArticlesListInteractor.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import Foundation

class ArticlesListInteractor: ArticlesListPresenterToInteractor {
    weak var presenter: ArticlesListInteractorToPresenter?
    var worker: WorkerProtocol?

    init(worker: WorkerProtocol) {
        self.worker = worker
    }

    func getEmailedList() {
        self.worker?.mostEmailedDelegate = self
        self.worker?.getMostEmailed()
    }
    
    func getSharedList() {
        self.worker?.mostSharedDelegate = self
        self.worker?.getMostShared()
    }
    
    func getViewedList() {
        self.worker?.mostViewedDelegate = self
        self.worker?.getMostViewed()
    }
    
}

extension ArticlesListInteractor:  GetMostEmailedProtocol {
    func didSuccessMostEmailed(response: MostEmailedModel) {
        presenter?.didSuccessMostEmailed(response: response)
    }
    
    func didFailedMostEmailed(with error: ErrorResponse?) {
        presenter?.didFailedMostEmailed(with: error)
    }
}

extension ArticlesListInteractor:  GetMostSharedProtocol {
    func didSuccessMostShared(response: MostSharedModel) {
        presenter?.didSuccessMostShared(response: response)

    }
    
    func didFailedMostShared(with error: ErrorResponse?) {
        presenter?.didFailedMostShared(with: error)

    }
}

extension ArticlesListInteractor:  GetMostViewedProtocol {
    func didSuccessMostViewed(response: MostViewedModel) {
        presenter?.didSuccessMostViewed(response: response)

    }
    
    func didFailedMostViewed(with error: ErrorResponse?) {
        presenter?.didFailedMostViewed(with: error)

    }
}
