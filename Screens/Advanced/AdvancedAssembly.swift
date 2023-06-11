//
//  AdvancedAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import Swinject

class AdvancedAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AdvancedViewController.self) { r in
            let view = AdvancedViewController(nibName: "AdvancedViewController", bundle: nil)
            let presenter = r.resolve(AdvancedPresenterProtocol.self)!
            let router = r.resolve(AdvancedRouterProtocol.self)!
            let factory = r.resolve(ViewControllerFactory.self)!
            let interactor = r.resolve(AdvancedInteractorProtocol.self)!
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.router = router
            router.factory = factory
            router.view = view

            return view
        }

        container.register(AdvancedPresenterProtocol.self) { _ in
            AdvancedPresenter()
        }

        container.register(AdvancedRouterProtocol.self) { _ in
            AdvancedRouter()
        }
        
        container.register(AdvancedInteractorProtocol.self) { _ in
            AdvancedInteractor()
        }
    }
}
