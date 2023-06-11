//
//  SigninProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation


protocol SigninViewProtocol: AnyObject{
    var presenter: SigninPresenterProtocol? {get set}
}

protocol SigninPresenterProtocol: AnyObject{
    var interactor: SigninInteractorProtocol? {get set}
    var router: SigninRouterProtocol? {get set}
    func saveUser(nameSurname: String, email: String, password: String)
    func navigateToHome()
}


protocol SigninInteractorProtocol: AnyObject{
    func saveUser(model: UserModel)
}


protocol SigninRouterProtocol: AnyObject{
    var view: SigninViewProtocol? {get set}
    var factory: ViewControllerFactory? {get set}
    func navigateToHome()
}

