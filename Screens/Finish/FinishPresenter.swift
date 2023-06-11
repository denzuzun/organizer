//
//  FinishPresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import Foundation


class FinishPresenter: FinishPresenterProtocol{
    var view: FinishViewProtcol?
    var interactor: FinishInteractorProtocol?
    var router: FinishRouterProtocol?
    
    func getData() {
        interactor?.getData(completionHandler: { result in
            switch result{
            case let .success(model):
                self.view?.setData(model: model)
            case let .failure(error):
                print(error)
            }
        })
    }
    
    func saveEvaluationData(p: String?, f: String?, d: String?, cm: String?) {
        let model = EvaluationModel(place: p,feed: f,drink: d,cam: cm)
        interactor?.saveEvaluationData(model: model)
    }
    
    func navigateToAdvanced() {
        router?.navigateToAdvanced()
    }
}
