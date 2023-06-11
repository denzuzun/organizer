//
//  FinishRouter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import Foundation


class FinishRouter: FinishRouterProtocol{
    var view: FinishViewProtcol?
    
    var factory: ViewControllerFactory?
    
    func navigateToAdvanced() {
        let advanced = factory?.advancedViewController
        advanced?.navigate = 1
        
        present(advanced, on: view)
    }
    
    
}
