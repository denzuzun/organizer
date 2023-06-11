//
//  SigninPresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation

class SigninPresenter: SigninPresenterProtocol {
    var interactor: SigninInteractorProtocol?

    var router: SigninRouterProtocol?

    func saveUser(nameSurname: String, email: String, password: String) {
        let model = UserModel(nameSurname: nameSurname, email: email, password: password)
        interactor?.saveUser(model: model)
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.navigateToHome()
        }
    }
    
    func navigateToHome() {
        router?.navigateToHome()
    }
}
