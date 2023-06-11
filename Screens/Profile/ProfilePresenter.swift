//
//  ProfilePresenter.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 11.06.2023.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    var view: ProfileViewProtocol?
    var interactor: ProfileInteractorProtocol?

    func getOrganizeData() {
        interactor?.getOrganizeData(completionHandler: { result in
            switch result {
            case let .success(model):
                self.view?.setData(model: model)
            case let .failure(error):
                print(error)
            }
        })
    }
}
