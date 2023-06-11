//
//  AdvancedRouter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation
import FirebaseAuth

class AdvancedRouter: AdvancedRouterProtocol{
    var view: AdvancedViewProtocol?
    
    var factory: ViewControllerFactory?
    
    func navigateToResult() {
       // push(factory?.finishViewController, from: view)
    }
    
    func navigateToDescription() {
        let description = factory?.descriptionViewController
        description?.currentUserMail = Auth.auth().currentUser?.email
        
        
        push(description,from: view)
    }
    
    func navigateToBar() {
        present(factory?.tabbarViewController, on: view)
    }
}
