//
//  SigninRouter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import Foundation


class SigninRouter: SigninRouterProtocol{
    var view: SigninViewProtocol?
    
    
    var factory: ViewControllerFactory?
    
    
    func navigateToHome() {
        present(factory?.tabbarViewController, on: view)
    }
    
    
}
