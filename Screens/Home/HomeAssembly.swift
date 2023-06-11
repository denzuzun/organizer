//
//  HomeAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import Swinject

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewController.self) { r in
            let view = HomeViewController(nibName: "HomeViewController", bundle: nil)
            let presenter = r.resolve(HomePresenterProtocol.self)!
            let interactor = r.resolve(HomeInteractorProtocol.self)!
            let router = r.resolve(HomeRouterProtocol.self)!
            let factory = r.resolve(ViewControllerFactory.self)!

            presenter.router = router
            presenter.interactor = interactor
            router.viewControllerFactory = factory
            view.presenter = presenter
            router.view = view

            return view
        }

        container.register(HomePresenterProtocol.self) { _ in
            HomePresenter()
        }

        container.register(HomeRouterProtocol.self) { _ in
            HomeRouter()
        }
        container.register(HomeInteractorProtocol.self) { _ in
            HomeInteractor()
        }
    }
}
