//
//  LoginRouter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation

class LoginRouter: LoginRouterProtocol{
    var view: LoginViewProtocol?
    var factory: ViewControllerFactory?
    
    func navigateToSignIn() {
        push(factory?.signinViewController, from: view)
    }
    
    func navigateToHome() {
        present(factory?.tabbarViewController, on: view)
    }
}
