//
//  HomeProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
}

protocol HomePresenterProtocol: AnyObject {
    var interactor: HomeInteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    func navigateToChoose(budget: String)
    func saveData(model: HomeModel)
    func signOut()
}

protocol HomeRouterProtocol: AnyObject {
    var view: HomeViewController? { get set }
    var viewControllerFactory: ViewControllerFactory? { get set }
    func navigateToChoose(budget: String)
    func navigateToLogin()
}

protocol HomeInteractorProtocol {
    func saveData(model: HomeModel)
    func signOut()
}
