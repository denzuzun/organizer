//
//  HomePresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    var interactor: HomeInteractorProtocol?
    var router: HomeRouterProtocol?

    func navigateToChoose(budget: String) {
        router?.navigateToChoose(budget: budget)
    }
    
    func saveData(model: HomeModel) {
        interactor?.saveData(model: model)
    }
    
    func signOut() {
        interactor?.signOut()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.router?.navigateToLogin()
        }
        
    }
}
