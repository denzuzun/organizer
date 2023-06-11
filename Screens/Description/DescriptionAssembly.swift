//
//  DesriptionAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import Swinject

class DescriptionAssembly: Assembly {
    func assemble(container: Container) {
        container.register(DescriptionViewController.self) { r in
            let view = DescriptionViewController(nibName: "DescriptionViewController", bundle: nil)
            let presenter = r.resolve(DescriptionPresenterProtocol.self)!
            let router = r.resolve(DescriptionRouterProtocol.self)!
            let factory = r.resolve(ViewControllerFactory.self)!
            let interactor = r.resolve(DescriptionInteractorProtocol.self)!
            presenter.router = router
            router.factory = factory
            view.presenter = presenter
            router.view = view
            presenter.interactor = interactor
            presenter.view = view

            return view
        }
        
        
        container.register(DescriptionPresenterProtocol.self) { _ in
            DescriptionPresenter()
        }

        container.register(DescriptionRouterProtocol.self) { _ in
            DescriptionRouter()
        }
        
        
        container.register(DescriptionInteractorProtocol.self) { _ in
            DescriptionInteractor()
        }
    }
}
