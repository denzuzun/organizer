//
//  LoginAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation
import Swinject

class LoginAssembly: Assembly{
    func assemble(container: Container) {
        container.register(LoginViewController.self) { r in
            let view = LoginViewController(nibName: "LoginViewController", bundle: nil)
            let presenter = r.resolve(LoginPresenterProtocol.self)!
            let interactor = r.resolve(LoginInteractorProtocol.self)!
            let router = r.resolve(LoginRouterProtocol.self)!
            let factory = r.resolve(ViewControllerFactory.self)!
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            router.factory = factory
            router.view = view
            return view
        }
        
        
        container.register(LoginPresenterProtocol.self) { _ in
            LoginPresenter()
        }

        container.register(LoginRouterProtocol.self) { _ in
            LoginRouter()
        }
        container.register(LoginInteractorProtocol.self) { _ in
            LoginInteractor()
        }
    }
}
