//
//  SelectionAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//


import Foundation
import Swinject


class SelectionAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SelectionViewController.self) { r in
            let view = SelectionViewController(nibName: "SelectionViewController", bundle: nil)
            let presenter = r.resolve(SelectionPresenterProtocol.self)!
            let router = r.resolve(SelectionRouterProtocol.self)!
            let factory = r.resolve(ViewControllerFactory.self)!
            
            presenter.router = router
            router.factory = factory
            view.presenter = presenter
            router.view = view
            
            return view
        }
        
        
        container.register(SelectionPresenterProtocol.self) { _ in
            SelectionPresenter()
        }

        container.register(SelectionRouterProtocol.self) { _ in
            SelectionRouter()
        }
        
    }
}
