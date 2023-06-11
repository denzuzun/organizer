//
//  DescriptionPresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

class DescriptionPresenter: DescriptionPresenterProtocol {
    var view: DescriptionViewControllerProtocol?

    var router: DescriptionRouterProtocol?
    var interactor: DescriptionInteractorProtocol?

    func navigateToAdvanced() {
        router?.navigateToAdvanced()
    }

    func getData() {
        interactor?.getEventData(completionHandler: { result in
            switch result {
            case let .success(model):
                self.view?.setData(model: model)
            case let .failure(error):
                print(error)
            }
        })
    }

    func saveDetail(text: String) {
        interactor?.saveDetail(text: text)
    }

    func getOrganize() {
        interactor?.getOrganize(completionHandler: { result in
            switch result {
            case let .success(model):
                self.view?.setMailBody(model: model)
            case let .failure(error):
                print(error)
            }
        })
    }
}
