//
//  AdvancedPresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

class AdvancedPresenter: AdvancedPresenterProtocol {
    var interactor: AdvancedInteractorProtocol?

    var router: AdvancedRouterProtocol?

    func navigateToResult() {
        router?.navigateToResult()
    }

    func savePlace(data: [String]) {
        interactor?.savePlace(data: data)
    }

    func saveFeed(data: [String]) {
        interactor?.saveFeed(data: data)
    }

    func saveDrink(data: [String]) {
        interactor?.saveDrink(data: data)
    }

    func saveCam(data: [String]) {
        interactor?.saveCam(data: data)
    }

    func navigateToDescription() {
        router?.navigateToDescription()
    }
    
    
    func navigateToBar() {
        router?.navigateToBar()
    }
}
