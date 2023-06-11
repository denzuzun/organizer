//
//  AdvanceProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

protocol AdvancedViewProtocol: AnyObject {
    var presenter: AdvancedPresenterProtocol? { get set }
    var placeResult: String? { get set }
    var feedResult: String? { get set }
    var drinkResult: String? { get set }
    var camMusicResult: String? { get set }
    var navigate: Int { get set }
    var budget: String? { get set }
}

protocol AdvancedPresenterProtocol: AnyObject {
    var router: AdvancedRouterProtocol? { get set }
    var interactor: AdvancedInteractorProtocol? { get set }
    func navigateToResult()
    func savePlace(data: [String])
    func saveFeed(data: [String])
    func saveDrink(data: [String])
    func saveCam(data: [String])
    func navigateToDescription()
    func navigateToBar()
}

protocol AdvancedRouterProtocol: AnyObject {
    var view: AdvancedViewProtocol? { get set }
    var factory: ViewControllerFactory? { get set }
    func navigateToResult()
    func navigateToDescription()
    func navigateToBar()
}

protocol AdvancedInteractorProtocol: AnyObject {
    func savePlace(data: [String])
    func saveFeed(data: [String])
    func saveDrink(data: [String])
    func saveCam(data: [String])
}
