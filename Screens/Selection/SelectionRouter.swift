//
//  SelectionRouter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation


class SelectionRouter: SelectionRouterProtocol {
    var view: SelectionViewController?
    
    var factory: ViewControllerFactory?
    
    func navigateToDescription(p: String, f: String, d: String, cm: String, budget: String) {
        var advanced = factory?.advancedViewController
        
        advanced?.placeResult = p
        advanced?.feedResult = f
        advanced?.drinkResult = d
        advanced?.camMusicResult = cm
        advanced?.budget = budget
        
        push(advanced, from: view)
    }
    
    
}
