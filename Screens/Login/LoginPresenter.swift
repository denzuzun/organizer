//
//  LoginPresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    var router: LoginRouterProtocol?
    var interactor: LoginInteractorProtocol?

    func navigateToSignIn() {
        router?.navigateToSignIn()
    }

    func checkUserState(email: String, password: String) {
        interactor?.checkUserState(email: email, password: password)

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.navigateToHome()
        }
    }

    func navigateToHome() {
        router?.navigateToHome()
    }
}
