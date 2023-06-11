//
//  ProfilProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import Foundation

protocol ProfileViewProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol? {get set}
    func setData(model: OrganizeModel)
}

protocol ProfilePresenterProtocol: AnyObject {
    var interactor: ProfileInteractorProtocol? {get set}
    var view: ProfileViewProtocol? {get set}
    func getOrganizeData()
}

protocol ProfileInteractorProtocol: AnyObject {
    func getOrganizeData(completionHandler: @escaping (Result<OrganizeModel, FirebaseError>) -> Void)
}
