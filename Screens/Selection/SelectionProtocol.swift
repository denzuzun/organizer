//
//  SelectionProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

protocol SelectionViewProtocol: AnyObject {
    var presenter: SelectionPresenterProtocol? { get set }
    var budget: String? { get set }
}

protocol SelectionPresenterProtocol: AnyObject {
    var router: SelectionRouterProtocol? { get set }
    func navigateToDescription(p: String, f: String, d: String, cm: String,budget: String)
}

protocol SelectionRouterProtocol: AnyObject {
    var view: SelectionViewController? { get set }
    var factory: ViewControllerFactory? { get set }
    func navigateToDescription(p: String, f: String, d: String, cm: String,budget: String)
}
