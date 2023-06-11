//
//  LoginProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation


protocol LoginViewProtocol: AnyObject{
    var presenter: LoginPresenterProtocol? {get set}
}

protocol LoginPresenterProtocol: AnyObject{
    var interactor: LoginInteractorProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
    func navigateToSignIn()
    func checkUserState(email: String, password: String)
    func navigateToHome()
}


protocol LoginInteractorProtocol: AnyObject{
    func checkUserState(email: String, password: String)
}


protocol LoginRouterProtocol: AnyObject{
    var view: LoginViewProtocol? {get set}
    var factory: ViewControllerFactory? {get set}
    func navigateToSignIn()
    func navigateToHome()
}

