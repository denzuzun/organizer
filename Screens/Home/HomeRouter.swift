//
//  HomeRouter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

class HomeRouter: HomeRouterProtocol {
    var viewControllerFactory: ViewControllerFactory?

    var view: HomeViewController?

    func navigateToChoose(budget: String) {
        let selection = viewControllerFactory?.selectionViewController
        selection?.budget = budget
        push(selection, from: view)
    }
    
    func navigateToLogin() {
        present(viewControllerFactory?.loginViewController, on: view)
    }
    
    
}
