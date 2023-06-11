//
//  DescriptionProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

protocol DescriptionViewControllerProtocol: AnyObject {
    var presenter: DescriptionPresenterProtocol? { get set }
    func setData(model: EventModel)
    func setMailBody(model: OrganizeModel)
    var currentUserMail: String? { get set }
}

protocol DescriptionPresenterProtocol: AnyObject {
    var router: DescriptionRouterProtocol? { get set }
    var view: DescriptionViewControllerProtocol? { get set }
    var interactor: DescriptionInteractorProtocol? { get set }
    func navigateToAdvanced()
    func getData()
    func saveDetail(text: String)
    func getOrganize()
}

protocol DescriptionRouterProtocol: AnyObject {
    var view: DescriptionViewControllerProtocol? { get set }
    var factory: ViewControllerFactory? { get set }
    func navigateToAdvanced()
}

protocol DescriptionInteractorProtocol: AnyObject {
    func getEventData(completionHandler: @escaping (Result<EventModel, FirebaseError>) -> Void)
    func saveDetail(text: String)
    func getOrganize(completionHandler: @escaping (Result<OrganizeModel, FirebaseError>) -> Void)
}
