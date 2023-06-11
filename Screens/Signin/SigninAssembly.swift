//
//  SigninAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation
import Swinject

class SigninAssembly: Assembly{
    func assemble(container: Container) {
        container.register(SigninViewController.self) { r in
            let view = SigninViewController(nibName: "SigninViewController", bundle: nil)
            let presenter = r.resolve(SigninPresenterProtocol.self)!
            let interactor = r.resolve(SigninInteractorProtocol.self)!
            let router = r.resolve(SigninRouterProtocol.self)!
            let factory = r.resolve(ViewControllerFactory.self)!
            
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            router.factory = factory
            router.view = view
            
            return view
            
        }
        
        container.register(SigninPresenterProtocol.self) { _ in
            SigninPresenter()
        }

        container.register(SigninRouterProtocol.self) { _ in
            SigninRouter()
        }
        container.register(SigninInteractorProtocol.self) { _ in
            SigninInteractor()
        }
    }
}
