//
//  SelectionPresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation


class SelectionPresenter: SelectionPresenterProtocol{
    
    var router: SelectionRouterProtocol?
    
    func navigateToDescription(p: String, f: String, d: String, cm: String,budget: String) {
       router?.navigateToDescription(p: p, f: f, d: d, cm: cm,budget: budget)
    }
    
    
}
