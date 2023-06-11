//
//  DescriptionRouter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

class DescriptionRouter: DescriptionRouterProtocol {
    var view: DescriptionViewControllerProtocol?

    var factory: ViewControllerFactory?

    func navigateToAdvanced() {
        push(factory?.advancedViewController, from: view)
    }
}
