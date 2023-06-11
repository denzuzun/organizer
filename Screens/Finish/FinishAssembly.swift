//
//  FinishAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import Swinject

class FinishAssembly: Assembly{
    func assemble(container: Container) {
        container.register(FinishViewController.self) { r in
            let view = FinishViewController(nibName: "FinishViewController", bundle: nil)
            let presenter = r.resolve(FinishPresenterProtocol.self)!
            let interactor = r.resolve(FinishInteractorProtocol.self)!
            let router = r.resolve(FinishRouterProtocol.self)!
            let factory = r.resolve(ViewControllerFactory.self)!
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.view = view
            presenter.router = router
            router.factory = factory
            router.view = view
            
            return view
        }
        
        container.register(FinishPresenterProtocol.self) { _ in
            FinishPresenter()
        }
        container.register(FinishInteractorProtocol.self) { _ in
            FinishInteractor()
        }
        container.register(FinishRouterProtocol.self) { _ in
            FinishRouter()
        }
    }
}
