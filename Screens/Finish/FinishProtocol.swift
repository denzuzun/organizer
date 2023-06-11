//
//  FinishProtocol.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 9.06.2023.
//

import Foundation

protocol FinishViewProtcol: AnyObject {
    var presenter: FinishPresenterProtocol? { get set }
    func setData(model: EvaluationModel)
}

protocol FinishPresenterProtocol: AnyObject {
    var interactor: FinishInteractorProtocol? { get set }
    var view: FinishViewProtcol? { get set }
    var router: FinishRouterProtocol? { get set }
    func getData()
    func saveEvaluationData(p: String?, f: String?, d: String?, cm: String?)
    func navigateToAdvanced()
}

protocol FinishInteractorProtocol: AnyObject {
    func getData(completionHandler: @escaping (Result<EvaluationModel, FirebaseError>) -> Void)
    func saveEvaluationData(model: EvaluationModel)
}

protocol FinishRouterProtocol: AnyObject {
    var view: FinishViewProtcol? { get set }
    var factory: ViewControllerFactory? { get set }
    func navigateToAdvanced()
}
