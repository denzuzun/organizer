//
//  ProfileAssembly.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import Foundation
import Swinject


class ProfileAssembly: Assembly{
    func assemble(container: Container) {
        container.register(ProfileViewController.self) { r in
            let view = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
            let presenter = r.resolve(ProfilePresenterProtocol.self)!
            let interactor = r.resolve(ProfileInteractorProtocol.self)!
            
            view.presenter = presenter
            presenter.interactor = interactor
            presenter.view = view
            
            return view
        }
        
        container.register(ProfilePresenterProtocol.self) { _ in
            ProfilePresenter()
        }
        container.register(ProfileInteractorProtocol.self) { _ in
            ProfileInteractor()
        }
    }
}
